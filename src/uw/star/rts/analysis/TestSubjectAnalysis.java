package uw.star.rts.analysis;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import uw.star.rts.artifact.*;
import uw.star.rts.util.*;

import com.google.common.base.Function;
import com.google.common.collect.*;

/**
 * This class provides data for analysis on factors may have impact on predictor's accuracy 
 * 1. Coverage relations stability - represented by the element changes in the coverage matrix
 * 2. Amount of code changes - represented by the entity change
 * 3. Overlaps on test case coverage - represented by the number of test case per entity
 **/
/**
 * REQUIREMENTS:
 * Automatic rules to check data validity
 * Print out in log the actual entity names for manual check
 * Calculate once , output to multiple formats(one contains detailed information, the other one only contains columns needed for factor analysis)
 * Output one version specific, one average of all versions
 * 
 * Use a data structure to allow direct write to a cell, the output of the data may not be sequential - check 
 * Must be flexible to add new columns or new factors as there are likely new factor need to be considered - check
 * reduce the amount of manual post -processing work in Excel
 * code reuse , break down to smaller methods - check
 * @author wliu
 *
 */
public class TestSubjectAnalysis {
	/**
	 * @section 4.3 in paper "{Using Coverage Information to Predict the Cost-Effectiveness
               of Regression Testing Strategies"
	 * @param testSubjects
	 */

	static String[] GENERAL_HEADERS = { //these values won't combine with entity level
		"#of TestCases", 
		"#of non-obsolete Test Cases (|T|)"
	};
	//factor1
	static String[] COVERRAGE_RELATIONS_HEADERS={
		"Cumulative Coverage(CC)",   //number of 1 in the matrix, count rows from regression test cases only
		"Total #of Elements",   //total number of rows x number of columns
		"#Changed Elements",
		"Elements Union"
	};
	//factor2
	static String[] ENTITY_CHANGES_HEADERS={
		"Total# of Entity", //0
		"#Covered Entity(Ec)",//1
		"#entity not covered",//2
		"#TC no coverage",//3
		"%of empty cells",//4
		"#Covered Entity(Ec) by Regression TC",//5
		"#Changed Entities(all)",//6
		"#Changed Covered Entities",//7 
	};	
	//factor3
	static String[] TESTCASE_COVERAGE_HEADERS={
		"Average# of Test Case per Covered Entity"
	};

	static Logger log = LoggerFactory.getLogger(TestSubjectAnalysis.class.getName());;
	
	static Table<String,String,Set<Entity>> changedCoveredEntityTable = HashBasedTable.create();

	//*this is the actual output orders on column
	private static List<String> createColumnHeaders(String type){
		List<String> header = new ArrayList<>();
		header.add(ENTITY_CHANGES_HEADERS[0]);
		header.add(ENTITY_CHANGES_HEADERS[1]);
		header.add(ENTITY_CHANGES_HEADERS[5]);
		header.add(COVERRAGE_RELATIONS_HEADERS[0]);
		header.add(ENTITY_CHANGES_HEADERS[6]);
		header.add(ENTITY_CHANGES_HEADERS[7]);
		header.add(COVERRAGE_RELATIONS_HEADERS[2]);
		header.add(ENTITY_CHANGES_HEADERS[3]);
		header.add(ENTITY_CHANGES_HEADERS[2]);
		header.add(ENTITY_CHANGES_HEADERS[4]);
		header.add(COVERRAGE_RELATIONS_HEADERS[1]);
		header.add(COVERRAGE_RELATIONS_HEADERS[3]);
		//add entity type prefix
		for(int i=0;i<header.size();i++)
			header.set(i, type+"-"+header.get(i));
		return header;
	}
	
	public static void analyzeAllFactors(List<Application> testSubjects){
		Map<String,List<String>> rows = new LinkedHashMap<>();
		for(Application app: testSubjects){
			ArrayTable<String,String,String> generalTable = analyzeGeneralInfo(app);
			ArrayTable<String,String,String> stmTable = analyzeFactors(app,EntityType.STATEMENT);
			ArrayTable<String,String,String> srcTable = analyzeFactors(app,EntityType.SOURCE);
			ArrayTable<String,String,String> clzTable = analyzeFactors(app,EntityType.CLAZZ);

			for(String ver: generalTable.rowKeyList()){
				List<String> row = new ArrayList<>();
				for(String col: GENERAL_HEADERS)
					row.add(generalTable.get(ver, col));
				for(String col: createColumnHeaders(EntityType.STATEMENT.toString()))
					row.add(stmTable.get(ver, col));
				for(String col: createColumnHeaders(EntityType.SOURCE.toString()))
					row.add(srcTable.get(ver, col));
				for(String col: createColumnHeaders(EntityType.CLAZZ.toString()))
					row.add(clzTable.get(ver, col));
				rows.put(ver, row);
			}
		}

		//create first row headers
		List<String> header = new ArrayList<>();
		header.add("TestSubject-Version");
		header.addAll(Arrays.asList(GENERAL_HEADERS));
		List<String >type = Arrays.asList(EntityType.STATEMENT.toString(),EntityType.SOURCE.toString(),EntityType.CLAZZ.toString());
		for(String t: type)
            header.addAll(createColumnHeaders(t));		
		
		sourceAndClassEntityRule(rows.keySet()); 
		
		ResultOutput.outputResult("TestSubjectAnalysis", header, rows);
	}

	public static ArrayTable<String,String,String> analyzeGeneralInfo(Application testapp){
		ArrayTable<String,String,String> tablePerApp = ArrayTable.create(Arrays.asList(createAppVersionKeys(testapp)),Arrays.asList(GENERAL_HEADERS));
		for(int i=0;i<testapp.getTotalNumVersons();i++){ //one per row
			String rowKey = createAppVersionKey(testapp,i);
			tablePerApp.put(rowKey,GENERAL_HEADERS[0], //			"#of TestCases",
					testapp.getTestSuite().getTestCaseByVersion(i).size()+"");
			tablePerApp.put(rowKey,GENERAL_HEADERS[1], //			"#of Regression Test Cases (|T|)"
					testapp.getTestSuite().getRegressionTestCasesByVersion(i).size()+"");
		}
		return tablePerApp;
	}
	/**
	 * Analyze Factors of all versions of a test subject on a given entity type
	 * one Table per test subject - combines all factors as they are all calculated based on the coverage matrix 
	 * @param testSubject one test subject contains all version
	 * @param the entity type analysis should be performed on
	 * @return a table contains all values of an application
	 */
	public static ArrayTable<String,String,String> analyzeFactors(Application testapp,EntityType entityType){

		TestSuite ts = testapp.getTestSuite();
		ArrayTable<String,String,String> tablePerApp = ArrayTable.create(Arrays.asList(createAppVersionKeys(testapp)),createColumnHeaders(entityType.toString()));
		CodeCoverage<Entity> lastVersionTrace = null;
		Set<String> entityUnionOfAllVersions = Sets.newHashSet();

		for(int i=0;i<testapp.getTotalNumVersons();i++){ //one per row
			String rowKey = createAppVersionKey(testapp,i);
			CodeCoverageAnalyzer cca =  CodeCoverageAnalyzerFactory.create(testapp.getRepository(),
					testapp,testapp.getProgram(ProgramVariant.orig, i),ts);

			CodeCoverage<Entity> trace =  cca.createCodeCoverage(entityType);
			//factor1
			int cc = trace.getCumulativeCoverage(ts.getRegressionTestCasesByVersion(i));
			tablePerApp.put(rowKey, entityType+"-"+COVERRAGE_RELATIONS_HEADERS[0], //"Cumulative Coverage(CC)",
					cc+"");

			tablePerApp.put(rowKey, entityType+"-"+COVERRAGE_RELATIONS_HEADERS[1], //"Total #of Elements",
					trace.getColumns().size()*trace.getRows().size()+"");

			tablePerApp.put(rowKey, entityType+"-"+COVERRAGE_RELATIONS_HEADERS[2], //"#Changed Elements",
					(i==0||lastVersionTrace==null)? "N/A":
						trace.diff(lastVersionTrace,EntityComparatorFactory.createComparator(entityType))+"");

			entityUnionOfAllVersions.addAll(Sets.newHashSet(Iterables.transform(
					trace.getCoveredEntities(ts.getRegressionTestCasesByVersion(i)),
					new EntityToFullyQualifiedNameFunction())));

			tablePerApp.put(rowKey, entityType+"-"+COVERRAGE_RELATIONS_HEADERS[3], //"Elements Union"
					entityUnionOfAllVersions.size()*ts.size()+"");

			//factor2
			tablePerApp.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[0],//"Total# of Entity",
					trace.getColumns().size()+"");

			
/*	 should always use non-obsolete test cases, this is removed*/ 		
/*tablePerApp.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[1],//"#Covered Entity(Ec)", 
					trace.getCoveredEntities().size()+"");*/

			tablePerApp.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[5],//"#Covered Entity(Ec) by Regression TC",
					trace.getCoveredEntities(ts.getRegressionTestCasesByVersion(i)).size()+"");
			
			tablePerApp.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[2],//"#entity not covered",
					trace.getColumns().size()-trace.getCoveredEntities(ts.getRegressionTestCasesByVersion(i)).size()+"");
			
			long totalNumCells = trace.getColumns().size()*trace.getRows().size();
			tablePerApp.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[4],//"%of empty cells", (total#of cells - CC / total#of cells )*100
					((totalNumCells-cc)*1.0/totalNumCells)*100+"");
			
			List<String> changes = analyzeChanges(testapp,entityType,i,rowKey,lastVersionTrace);
			tablePerApp.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[6],//	"#Changed Entities(all)",
					changes.get(0)); // write analysis result to the next row

			tablePerApp.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[7],//	"#Changed Covered Entities", 
					changes.get(1));

			lastVersionTrace = trace; //keep it for next version
		}
		return tablePerApp;
	}

	
	private static List<String> analyzeChanges(Application testapp,EntityType entityType,int i,String rowKey,CodeCoverage<Entity> lastVersionTrace){
		List<String> changeResults = new ArrayList<>();
		//"#Changed Entities(all)",this would need to do change analysis
		String numChangedEntities = "N/A";
		String numChangedCoveredEntities = "N/A";
		if(i!=0){
			Set<Entity> modifiedEntity = Sets.newHashSet();
			Program p =testapp.getProgram(ProgramVariant.orig, i-1);
			Program pPrime = testapp.getProgram(ProgramVariant.orig, i);
			if(entityType.equals(EntityType.SOURCE)){//parse diff results
				ChangeAnalyzer ca = new TextualDifferencingChangeAnalysis(testapp.getRepository(),p,pPrime);
				ca.analyzeChange();
				List<SourceFileEntity> modifiedSrc = ca.getModifiedSourceFiles();
				numChangedEntities = modifiedSrc.size()+"";
				log.debug("modified source files in "+rowKey+ " total:" +  numChangedEntities + " : "+ modifiedSrc);
				modifiedEntity.addAll(modifiedSrc);
			}else if(entityType.equals(EntityType.STATEMENT)){//parse diff results
				ChangeAnalyzer ca = new TextualDifferencingChangeAnalysis(testapp.getRepository(),p,pPrime);
				ca.analyzeChange();
				List<StatementEntity> modifiedStm = ca.getModifiedStatements(); //these are the entities in p  
				numChangedEntities = modifiedStm.size()+"";
				log.debug("modified statements between "+ p.getName() + "and " + pPrime.getName() +" total:" +  numChangedEntities + " : "+ modifiedStm);
				modifiedEntity.addAll(modifiedStm);
			}else{
				Map<String,List<ClassEntity>> resultMap = MD5ClassChangeAnalyzer.diff(p, pPrime);
				numChangedEntities = resultMap.get("MODIFIED").size() + resultMap.get("DELETED").size()  +"";
				log.debug("modified classes in "+rowKey+ " total:"+ resultMap.get("MODIFIED").size() + " : " + resultMap.get("MODIFIED")+"\n");
				log.debug("DELETED classes in "+rowKey+ " total: " + resultMap.get("DELETED").size() + " : " + resultMap.get("DELETED")+"\n");
				modifiedEntity.addAll(resultMap.get("MODIFIED"));
				modifiedEntity.addAll(resultMap.get("DELETED"));
			}
			//"#Changed Covered Entities",

            Set<Entity> coveredSet= Sets.newHashSet(lastVersionTrace.getCoveredEntities(testapp.getTestSuite().getRegressionTestCasesByVersion(i)));

            //then intersec
			Set<Entity> changedCoveredEntity = Sets.intersection(coveredSet,modifiedEntity);
			//keep this in a table for comparison later
			if(entityType==EntityType.SOURCE||entityType==EntityType.CLAZZ)
				changedCoveredEntityTable.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[7], ImmutableSet.copyOf(changedCoveredEntity));
			
			numChangedCoveredEntities = changedCoveredEntity.size()+"";
			log.debug("modifed and covered "+entityType+" in "+ rowKey+ " total: " + numChangedCoveredEntities + " : "+changedCoveredEntity );
		}
		changeResults.add(numChangedEntities);
		changeResults.add(numChangedCoveredEntities);
		return changeResults;
	}
	
	/**
	 * This compares changed and covered class entities with changed and covered source entities
	 * for every changedCoveredSource
	 *    find it's classes ->push to okayClasses
	 * for every changedCoveredClass
	 *     if can not  find it's source in the change source list 
	 *      push to modifiedClsStrSet
	 * {modifiedClsStrSet} - {okayClasses}-> this is the set the classes changed but not source change - report error
	 */
	private static void sourceAndClassEntityRule(Set<String> versions){
		log.info("checking rule : Changed covered class should in changed covered source\n");
		
		for(String ver: versions){

			if(changedCoveredEntityTable.rowKeySet().contains(ver)){
				Set<String> okayClasses = new HashSet<>();
				Set<String> okaySources = new HashSet<>();
				for(Entity src: changedCoveredEntityTable.get(ver, EntityType.SOURCE+"-"+ENTITY_CHANGES_HEADERS[7])){
					okaySources.add(src.toString());
					okayClasses.addAll(new QDoxJavaParser().getClassesFromSource(src.getArtifactFile()));
				}
				Set<String> modifiedClsStrSet = new HashSet<>();
				for(Entity e:changedCoveredEntityTable.get(ver, EntityType.CLAZZ+"-"+ENTITY_CHANGES_HEADERS[7])){
					ClassEntity clz = (ClassEntity)e;
					String srcName = clz.getBestGuessJavaSourceFileName();
				    String fullSrcName = clz.getPackageName().equals("")?srcName+".java":
					                     clz.getPackageName()+"."+srcName+".java";
					if(!(okaySources.contains(fullSrcName)))
						modifiedClsStrSet.add(e.toString());
				}
				//verify every changed classes' source are in the changed source list
				
				for(String cls: Sets.difference(modifiedClsStrSet, okayClasses))
					log.error(ver + " modified class " + cls+ " is not in modified source list\n");
		        		
			}
		}
		log.info("Completed rule checking: Changed covered class should in changed covered source\n");
	}


	/**
	 * create an array of Strings that can be used as row keys in the table
	 * key is in the format of application name - v\d - e.g. apache-ant-v0
	 * @param testapp
	 * @return
	 */
	private static String[] createAppVersionKeys(Application testapp){
		String[] keys = new String[testapp.getTotalNumVersons()];
		for(int i=0;i<keys.length;i++)
			keys[i]=testapp.getApplicationName()+"-v"+i;
		return keys;
	}

	private static String createAppVersionKey(Application testapp, int ver){
		return testapp.getApplicationName()+"-v"+ver;
	}
	

}



