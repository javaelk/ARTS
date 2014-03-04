package uw.star.rts.analysis;

import java.util.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.lang.time.StopWatch;
import org.slf4j.LoggerFactory;
import org.xml.sax.SAXException;

import uw.star.rts.analysis.jacoco.*;
import uw.star.rts.artifact.*;
import uw.star.rts.extraction.ArtifactFactory;
import uw.star.rts.util.XMLJAXBUtil;
import com.google.common.collect.*;

public class JacocoCodeCoverageAnalyzer extends CodeCoverageAnalyzer{

	static int totalExecutableStms;
	static int totalCoveredStms;

	/**
	 * constructor to provide all information needed
	 * 
	 */
	public JacocoCodeCoverageAnalyzer(ArtifactFactory af, Application testapp, Program p,TestSuite testSuite){
		super(af,testapp,p,testSuite);
		log = LoggerFactory.getLogger(JacocoCodeCoverageAnalyzer.class.getName());
	}
	
	@Override
	public void parseReport(Program p,TestCase t){
		parseJacocoXMLReport(af.getCoverageResultFile(TraceType.CODECOVERAGE_JACOCO,program,t,"xml"));
	}
    @Override
	public <E extends Entity> CodeCoverage<E> createCodeCoverage(EntityType type){
    	return createCodeCoverage(type,TraceType.CODECOVERAGE_JACOCO);
    }
    
	//extract covered entities would extract all entities again, to avoid side effect, all container are clear at the beginning of each extraction. clearall()

	/**
	 * Use XML JAXB to parse JaCoCo XML report, all entities type are created as XML file is parsed. and all covered entities are populated as well. 
	 * All entities type are extract in one pass of the XML file(easier to code this way and performance is better). The disadvantage is it takes a lot more memory.
	 * TODO: possible to change to lazy initialization?  
	 * @see http://www.javaworld.com/javaworld/jw-06-2006/jw-0626-jaxb.html
	 * @param xml
	 */
	private void parseJacocoXMLReport(Path xml){
		//use JAXB to unmarshall XML doc if not already done. this would read the whole XML file into memory as a tree
		try(InputStream stream = Files.newInputStream(xml)){
			Report jacocoReport =XMLJAXBUtil.unmarshall(Report.class,stream);
			if(jacocoReport!=null){
				//parse the XML report follow the hierarchy of source->class->method, source->statement
				for(Object gp: jacocoReport.getGroupOrPackage()){
					if(gp instanceof uw.star.rts.analysis.jacoco.Group){
						log.error("not yet implemented");
					}else if(gp instanceof uw.star.rts.analysis.jacoco.Package){
						uw.star.rts.analysis.jacoco.Package p= (uw.star.rts.analysis.jacoco.Package)gp;
						//log.debug("package name: " + p.getName());
						//get all sourcefile and line under this package
						parseSourcefileAndLine(p);
						//get class and method under this package
						parseClassAndMethod(p);
					}
				}//end of package loop
			}else{
				log.error("context tree is still null after unmarshall the result xml file " + xml.getFileName());
			}	
		}catch(IOException e){
			log.error("IOException in reading file " + xml.getFileName());
			e.printStackTrace();
		}catch(JAXBException | ParserConfigurationException | SAXException e){
			log.error("JAXBException"+ xml.getFileName());
			e.printStackTrace();
		}
	}

	
	/**
	 * Parse all sourcefile and statement for a package
	 * @param p
	 */
	private void parseSourcefileAndLine(uw.star.rts.analysis.jacoco.Package p){
		String packageName = p.getName().replaceAll("/", ".");
		for(Object o :p.getClazzOrSourcefile()){
			if(o instanceof uw.star.rts.analysis.jacoco.Sourcefile){
				uw.star.rts.analysis.jacoco.Sourcefile srcFile = (uw.star.rts.analysis.jacoco.Sourcefile)o;
				String srcfileName = srcFile.getName();
				//log.debug("source file name: "+ srcfileName);
				Path srcfilePath = program.getCodeFilebyName(CodeKind.SOURCE, packageName, srcfileName);
				SourceFileEntity srcEnt = new SourceFileEntity(program,packageName,srcfileName,srcfilePath);
				srcEntities.add(srcEnt); //add a source file entity
                if(isCovered(srcFile))
                	coveredSrcEntities.add(srcEnt);
                
				//get all statements under this sourcefile
				//Jacoco report xml file only contains line number, but does not have the string of that line. Need to parse the actual java source file to get the statement string
				
                //BUG FIXES: use Files.newBufferReader(path,StandardCharsets.ISO_8859_1) instead of UTF-8. 
				try(BufferedReader reader = Files.newBufferedReader(srcfilePath, StandardCharsets.ISO_8859_1)){
				
					//special list to keep statements as their order in the xml report
					List<StatementEntity> orderedAllExecutableStm = new ArrayList<>();
					
					int currentLineNum =1;  //line number starting from 1	
					for(uw.star.rts.analysis.jacoco.Line stm: srcFile.getLine()){

						int lineNum = Integer.parseInt(stm.getNr());
						String line ="";
						while(currentLineNum<=lineNum&&line!=null){ //keep reading till end of the file or reach the lineNum
							line = reader.readLine();
							currentLineNum++;
						} //skip lines before lineNum
						if(line==null){
							log.error("line " + lineNum + " does not exist in file " + srcfilePath.toString() );
							break;
						}
						StatementEntity stmEntity =new StatementEntity(srcEnt,lineNum,line);
						stmEntity.setSourceFileEntity(srcEnt);  //statement -> source linked is used. 
						stmEntities.add(stmEntity);
						orderedAllExecutableStm.add(stmEntity);
						if(isCovered(stm))
							coveredStmEntities.add(stmEntity);
						
					}

					//source -> statement link, update all executable statements, this should be already ordered.
					if(!orderedAllExecutableStm.isEmpty()) 
						srcEnt.setExecutableStatements(orderedAllExecutableStm);
					
					
				} catch (IOException e) {
					log.error("IOException in reading file"+ srcfilePath);
					e.printStackTrace();
				}

			}
		}
	}
    
	/*
	 * Parse Class and Method section in Jacoco xml report. Iterate all class and method entities and update covered entities at the same time.
	 */
	private void parseClassAndMethod(uw.star.rts.analysis.jacoco.Package p){
		String packageName = p.getName().replaceAll("/", ".");
		for(Object o :p.getClazzOrSourcefile()){
			if(o instanceof uw.star.rts.analysis.jacoco.Class){
				uw.star.rts.analysis.jacoco.Class currentClazz =(uw.star.rts.analysis.jacoco.Class)o; 
				String fullyQualifiedClassName = currentClazz.getName().replaceAll("/", ".");
				String className = fullyQualifiedClassName.substring(fullyQualifiedClassName.lastIndexOf(".")+1);
				//log.debug("class name: "+ className);
				Path classfilePath = program.getCodeFilebyName(CodeKind.BINARY, packageName, className);
				ClassEntity classEnt = new ClassEntity(program,packageName,className,classfilePath);
				//classEnt.setSource(findSourceEntityByClassname(packageName,className));  //this link was used to roll up class coverage to source coverage in emma but no longer needed for jacoco
				classEntities.add(classEnt); //add a class entity
				if(isCovered(currentClazz))
					coveredClassEntities.add(classEnt);

				List <MethodEntity> methodsOfCurrentClass = new ArrayList<>();  //this holds all methods of current class to build linkage
				//get all methods under this class node
				for(uw.star.rts.analysis.jacoco.Method currentMethod: currentClazz.getMethod()){
					String methodName = currentMethod.getName()+"."+currentMethod.getDesc();
					//log.debug("method name :"+ methodName);
					MethodEntity methodEnt = new MethodEntity(classEnt,methodName);
					methodEnt.setClassEntity(classEnt); //method ->class
					methodEntities.add(methodEnt); //add a method
					if(isCovered(currentMethod))
						coveredMethodEntities.add(methodEnt);
					methodsOfCurrentClass.add(methodEnt);
				}//end of method node loop
				classEnt.setMethods(methodsOfCurrentClass);//class ->method
			}
		}//end of class loop
	}

	//class is covered ==> <counter type="CLASS" missed="0" covered="1"/>
	private boolean isCovered(uw.star.rts.analysis.jacoco.Class classNode){
		for(uw.star.rts.analysis.jacoco.Counter c: classNode.getCounter())
			if(c.getType().equals("CLASS")&&c.getMissed().equals("0")&&c.getCovered().equals("1"))
				return true;
		return false;
	}
	
	//sourcefile is covered ==> <counter type="CLASS" missed=xxx covered>0/> , a source file could have multiple classes, as long as one class is covered, source is covered.
	private boolean isCovered(uw.star.rts.analysis.jacoco.Sourcefile sourceFileNode){
		for(uw.star.rts.analysis.jacoco.Counter c: sourceFileNode.getCounter())
			if(c.getType().equals("CLASS")&&Integer.parseInt(c.getCovered())>0)
				return true;
		return false;
	}

	
	//method is covered ==> <counter type="METHOD" missed="0" covered="1"/>
	private boolean isCovered(uw.star.rts.analysis.jacoco.Method methodNode){
		for(uw.star.rts.analysis.jacoco.Counter c: methodNode.getCounter())
			if(c.getType().equals("METHOD")&&c.getMissed().equals("0")&&c.getCovered().equals("1"))
				return true;
		
		return false;
	}
	
	//statement is covered ==><line nr="98" mi="0" ci="3" , ci ( covered instruction) is greater than 0
	private boolean isCovered(uw.star.rts.analysis.jacoco.Line lineNode){
         return Integer.parseInt(lineNode.getCi())>0;
	}

}
