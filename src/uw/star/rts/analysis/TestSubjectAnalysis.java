package uw.star.rts.analysis;

import java.util.*;

import org.apache.commons.collections.CollectionUtils;

import uw.star.rts.artifact.*;
import uw.star.rts.util.*;
import com.google.common.collect.*;
import com.google.common.base.*;
/**
 * Analyze attributes of test subjects and confirm some assumptions 
 * 1. the relation coversM(t,e) changes very little during maintenance
 * 2. 
 * @author wliu
 *
 */
public class TestSubjectAnalysis {
	/**
	 * @section 4.3 in paper "{Using Coverage Information to Predict the Cost-Effectiveness
               of Regression Testing Strategies"
	 * @param testSubjects
	 */
	public static void analyzeCoverageStability(List<Application> testSubjects){

		String[] header = {"TestSubject-Version","#of TestCases","#of Regression Test Cases (|T|)",
				"Statement-Total# of Entity","Statement-#Covered Entity(Ec)","Statement-#Covered Entity(Ec) by regression TC","Statement-Cumulative Coverage(CC)","Statement-#Changed Elements","Statement-total#of Elements",
				"Source-Total# of Entity","Source-#Covered Entity(Ec)","Source-#Covered Entity(Ec) by regression TC","Source-Cumulative Coverage(CC)","Source-#Changed Elements","Source-total#of Elements",
				"Class-Total# of Entity","Class-#Covered Entity(Ec)","Class-#Covered Entity(Ec) by regression TC","Class-Cumulative Coverage(CC)","Class-#Changed Elements","Class-Total#of Elements"};

		Map<String,List<String>> rows = new LinkedHashMap<>();
		for(Application testapp: testSubjects){ 
			
			TestSuite ts = testapp.getTestSuite();
			CodeCoverage<StatementEntity> lastVersionStmTrace = null;  //reset for each application
			CodeCoverage<SourceFileEntity> lastVersionSrcTrace =null;
			CodeCoverage<ClassEntity> lastVersionClassTrace =null;
			Set<String> stmEntityUnion = new HashSet<>(); //this is used to count total number of element
			Set<String> srcCoveredEntityUnion = new HashSet<>();
			Set<String> classEntityUnion = new HashSet<>();
			
			for(int i=0;i<testapp.getTotalNumVersons();i++){ //one per row
				List<String> row = new ArrayList<>();
				//Apache-ant-v0
				String key = testapp.getApplicationName()+"-v"+i;
				row.add(ts.getTestCaseByVersion(i).size()+"");
				row.add(ts.getRegressionTestCasesByVersion(i).size()+"");
				
				//statement
				
				CodeCoverageAnalyzer cca = new JacocoCodeCoverageAnalyzer(testapp.getRepository(),testapp,testapp.getProgram(ProgramVariant.orig, i),ts);
				CodeCoverage stmTrace =  cca.createCodeCoverage(EntityType.STATEMENT);
                row.add(stmTrace.getColumns().size()+""); //Statement-Total# of Entity
                row.add(stmTrace.getCoveredEntities().size()+""); //"Statement-#Covered Entity(Ec)
                List<StatementEntity> coveredStmEntities =stmTrace.getCoveredEntities(ts.getRegressionTestCasesByVersion(i)); 
                row.add(coveredStmEntities.size()+"");//Statement-#Covered Entity(Ec) by regression TC
                row.add(stmTrace.getCumulativeCoverage(ts.getRegressionTestCasesByVersion(i))+"");//Statement-Cumulative Coverage(CC)
                                
                //#changed entity
                if(i==0){
                	row.add("N/A");
                }else{//lastVersions should not be null then.
                	int stmchange =-1;
					if(lastVersionStmTrace!=null)
						stmchange = stmTrace.diff(lastVersionStmTrace,new StatementEntityComparator());
					row.add(stmchange+"");//Statement-#Changed Entity
                }
                lastVersionStmTrace =   stmTrace; //keep it for next version
                
                Function<StatementEntity,String> stmEntityToFullyQualifiedName = new Function<StatementEntity,String>(){
                	public String apply(StatementEntity from){
                		return from.getApplicationName()+"."+from.getPackageName()+"."+from.getSrcName()+"."+from.getStatement();
                	}
                };              
                stmEntityUnion.addAll(Sets.newHashSet(Iterables.transform(coveredStmEntities,stmEntityToFullyQualifiedName))); 
                row.add(stmEntityUnion.size()*ts.size()+"");
                              
				//src
				cca.extractEntities(EntityType.SOURCE);
				CodeCoverage srcTrace =  cca.createCodeCoverage(EntityType.SOURCE);
                row.add(srcTrace.getColumns().size()+""); //Source-Total# of Entity
                row.add(srcTrace.getCoveredEntities().size()+""); //"Source-#Covered Entity(Ec)
                List<SourceFileEntity> coveredSrcEntities =srcTrace.getCoveredEntities(ts.getRegressionTestCasesByVersion(i)); 
                row.add(coveredSrcEntities.size()+"");//source-#Covered Entity(Ec) by regression TC
                row.add(srcTrace.getCumulativeCoverage(ts.getRegressionTestCasesByVersion(i))+"");//source-Cumulative Coverage(CC)
				
                if(i==0){
                	row.add("N/A");

                }else{//lastVersions should not be null then.
                	int srcchange =-1;
					if(lastVersionSrcTrace!=null)//#changed entity
						srcchange = srcTrace.diff(lastVersionSrcTrace,new SourceFileEntityComparator());
					row.add(srcchange+"");//Source-#Changed Entity
                }
                lastVersionSrcTrace =   srcTrace; //keep it for next version
                
              //convert SrcEntity Objects into Strings of fully qualified names
                Function<SourceFileEntity,String> srcEntityToFullyQualifiedName = new Function<SourceFileEntity,String>(){
                	public String apply(SourceFileEntity from){
                		return from.getApplicationName()+"."+from.getPackageName()+"."+from.getSourceFileName();
                	}
                };            
                srcCoveredEntityUnion.addAll(Sets.newHashSet(Iterables.transform(coveredSrcEntities,srcEntityToFullyQualifiedName)));
                row.add(srcCoveredEntityUnion.size()*ts.size()+"");
                
                //class
				cca.extractEntities(EntityType.CLAZZ);
				CodeCoverage clazzTrace =  cca.createCodeCoverage(EntityType.CLAZZ);
                row.add(clazzTrace.getColumns().size()+""); //Class-Total# of Entity
                row.add(clazzTrace.getCoveredEntities().size()+""); //"Class-#Covered Entity(Ec)
                List<ClassEntity> coveredClassEntities =clazzTrace.getCoveredEntities(ts.getRegressionTestCasesByVersion(i)); 
                row.add(coveredClassEntities.size()+"");//Class-#Covered Entity(Ec) by regression TC
                row.add(clazzTrace.getCumulativeCoverage(ts.getRegressionTestCasesByVersion(i))+"");//Class-Cumulative Coverage(CC)
				
                if(i==0){
                	row.add("N/A");
                }else{//lastVersions should not be null then.
                	int classchange =-1;
					if(lastVersionClassTrace!=null)//#changed entity
						classchange = clazzTrace.diff(lastVersionClassTrace,new ClassEntityComparator());
					row.add(classchange+"");//Class-#Changed Entity
                }
                lastVersionClassTrace =   clazzTrace; //keep it for next version
                Function<ClassEntity,String> classEntityToFullyQualifiedName = new Function<ClassEntity,String>(){
                	public String apply(ClassEntity from){
                		return from.getApplicationName()+"."+from.getPackageName()+"."+from.getClassName();
                	}
                	
                };
                classEntityUnion.addAll(Sets.newHashSet(Iterables.transform(coveredClassEntities,classEntityToFullyQualifiedName)));
                row.add(classEntityUnion.size()*ts.size()+"");
                
                rows.put(key, row);
			}
			


		}
		ResultOutput.outputResult("TestSubjectAnalysis", Arrays.asList(header), rows);

	}
	
}



