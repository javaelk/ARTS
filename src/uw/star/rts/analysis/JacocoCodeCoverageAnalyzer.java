package uw.star.rts.analysis;

import java.util.*;
import java.util.regex.Pattern;
import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.*;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xml.sax.SAXException;

import uw.star.rts.analysis.jacoco.*;
import uw.star.rts.artifact.*;
import uw.star.rts.extraction.ArtifactFactory;
import uw.star.rts.util.XMLJAXBUtil;
import com.google.common.collect.*;

public class JacocoCodeCoverageAnalyzer {

	ArtifactFactory af;
	Application testapp;
	Program program;
	TestSuite testSuite;
	Logger log;

	//containers for each entity types, these are populated by parseXML
	Set <SourceFileEntity> srcEntities;
	Set <ClassEntity> classEntities;
	Set <MethodEntity> methodEntities;
	Set <StatementEntity> stmEntities;

	//values of the following should be changed for each test case, i.e. class/method/statement coverage are different for each test case
	//coverage only on class and method, not on source file, these are populated by parseXML
	Set <ClassEntity> coveredClassEntities;
	Set <MethodEntity> coveredMethodEntities;

	static int totalExecutableStms;
	static int totalCoveredStms;

	//Special char &#160 - ASCII HEX A0
	private static final Pattern nonASCII = Pattern.compile("\\xa0");


	/**
	 * constructor to provide all information needed
	 * 
	 */
	JacocoCodeCoverageAnalyzer(ArtifactFactory af, Application testapp, Program p,TestSuite testSuite){
		log = LoggerFactory.getLogger(JacocoCodeCoverageAnalyzer.class.getName());
		this.af = af;
		this.testapp = testapp;
		this.program =p;
		this.testSuite= testSuite;

		srcEntities = new HashSet<>();
		classEntities = new HashSet<>();
		methodEntities = new HashSet<>();
		stmEntities = new HashSet<>();
	}

	/**
	 * extract code entities of given type and link back to the program, src entities are set in any cases.
	 * TODO: use other ways to extract all entities. JaCoCo XML reports do not contain interfaces.
	 * Ideally, the program artifact should contain ALL classes regardless it's interface or not.
	 * TODO: user java generic to replace EntityType parameter 
	 * @param type
	 * @return
	 */
	public  List<? extends Entity> extractEntities(EntityType type){
		List<? extends Entity> result = null;
		List<TestCase> testcases =testSuite.getTestCaseByVersion(program.getVersionNo());
		if(testcases.size()==0){
			log.error("test case set should not be zero");
		}else{
			TestCase t0 =testcases.get(0);
			log.debug("parse xml result of test case :" + t0);
			//parse any xml result file would have the same entities
			parseJacocoXMLReport(af.getJaCoCoCodeCoverageResultFile(program,t0,"xml"));

			switch(type){
			case CLAZZ : 
				result= ImmutableList.copyOf(classEntities);
				break;

			case METHOD : 
				result= ImmutableList.copyOf(methodEntities);
				break;

			case SOURCE : 
				result =  ImmutableList.copyOf(srcEntities);
				break;

			case STATEMENT: 
				result = ImmutableList.copyOf(stmEntities);
				break;

			default : 
				log.error("unknown enum value found" + type);
			}

			//always link source entities to program as all other types are linked to source
			if(!type.equals(EntityType.SOURCE)) 
				program.setCodeEntities(EntityType.SOURCE, ImmutableList.copyOf(srcEntities));
			program.setCodeEntities(type,result);
		}
		return result;
	}

	//TODO: extract covered entities

	/**
	 * Use XML JAXB to parse JaCoCo XML report, all entities type are created as XML file is parsed. and all covered entities are populated as well. 
	 * It's easier to code if all entities type are extract in one pass of the XML file. The disadvantage is it takes a lot more memory.
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
						log.debug("package name: " + p.getName());
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
				log.debug("source file name: "+ srcfileName);
				Path srcfilePath = program.getCodeFilebyName(CodeKind.SOURCE, packageName, srcfileName);
				SourceFileEntity srcEnt = new SourceFileEntity(program,packageName,srcfileName,srcfilePath);
				srcEntities.add(srcEnt); //add a source file entity

				//get all statements under this sourcefile
				//Jacoco report xml file only contains line number, but does not have the string of that line. Need to parse the actual java source file to get the statement string
				Charset cs = Charset.forName("UTF-8");
				try(BufferedReader reader = Files.newBufferedReader(srcfilePath, cs)){
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
					}
				} catch (IOException e) {
					log.error("IOException in reading file"+ srcfilePath);
					e.printStackTrace();
				}

			}
		}
	}

	private void parseClassAndMethod(uw.star.rts.analysis.jacoco.Package p){
		String packageName = p.getName().replaceAll("/", ".");
		for(Object o :p.getClazzOrSourcefile()){
			if(o instanceof uw.star.rts.analysis.jacoco.Class){
				uw.star.rts.analysis.jacoco.Class currentClazz =(uw.star.rts.analysis.jacoco.Class)o; 
				String fullyQualifiedClassName = currentClazz.getName().replaceAll("/", ".");
				String className = fullyQualifiedClassName.substring(fullyQualifiedClassName.lastIndexOf(".")+1);
				log.debug("class name: "+ className);
				Path classfilePath = program.getCodeFilebyName(CodeKind.BINARY, packageName, className);
				ClassEntity classEnt = new ClassEntity(program,packageName,className,classfilePath);
				// LINK:	classEnt.setSource(findSourceEntityByClassname(packageName,className));  //this link was used to roll up class coverage to source coverage in emma but no longer needed for jacoco
				classEntities.add(classEnt); //add a class entity

				//LINK : List <MethodEntity> methodsOfCurrentClass = new ArrayList<>();  //this holds all methods of current class to build linkage
				//get all methods under this class node
				for(uw.star.rts.analysis.jacoco.Method currentMethod: currentClazz.getMethod()){
					String methodName = currentMethod.getName()+"."+currentMethod.getDesc();
					log.debug("method name :"+ methodName);
					MethodEntity methodEnt = new MethodEntity(program,packageName,fullyQualifiedClassName,methodName,classfilePath);
					//LINK : methodEnt.setClassEntity(classEnt); //method ->class
					methodEntities.add(methodEnt); //add a method
					//LINK: methodsOfCurrentClass.add(methodEnt);
				}//end of method node loop
				//LINK: classEnt.setMethods(methodsOfCurrentClass);//class ->method
			}
		}//end of class loop
	}



}
