package uw.star.rts.analysis;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import uw.star.rts.artifact.*;
import uw.star.rts.extraction.SIRJavaFactory;
import uw.star.rts.util.*;

import com.google.common.collect.*;
import com.google.common.base.*;
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
 * Use a data structure to allow direct write to a cell, the output of the data may not be sequential 
 * Must be flexible to add new columns or new factors as there are likely new factor need to be considered
 * reduce the amount of manual post -processing work in Excel
 * code reuse , break down to smaller methods
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
		"#of Regression Test Cases (|T|)"
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
		"Total# of Entity",
		"#Covered Entity(Ec)",
		"#Covered Entity(Ec) by Regression TC",
		"#Changed Entities(all)",
		"#Changed Covered Entities", 
	};	
	//factor3
	static String[] TESTCASE_COVERAGE_HEADERS={
		"Average# of Test Case per Covered Entity"
	};

	static Logger log;
	public TestSubjectAnalysis(){
		log= LoggerFactory.getLogger(TestSubjectAnalysis.class.getName());
	}

	public static void analyzeAllFactors(List<Application> testSubjects){
		Map<String,List<String>> rows = new HashMap<>();
		for(Application app: testSubjects){
			ArrayTable<String,String,String> generalTable = analyzeGeneralInfo(app);
			ArrayTable<String,String,String> stmTable = analyzeFactors(app,EntityType.STATEMENT);
			ArrayTable<String,String,String> srcTable = analyzeFactors(app,EntityType.SOURCE);
			ArrayTable<String,String,String> clzTable = analyzeFactors(app,EntityType.CLAZZ);

			for(String ver: generalTable.rowKeyList()){
				List<String> row = new ArrayList<>();

				for(String col: GENERAL_HEADERS)
					row.add(generalTable.get(ver, col));

				for(String col: COVERRAGE_RELATIONS_HEADERS)
					row.add(stmTable.get(row, EntityType.STATEMENT+"-"+col));
				for(String col: ENTITY_CHANGES_HEADERS)
					row.add(stmTable.get(row, EntityType.STATEMENT+"-"+col));

				for(String col: COVERRAGE_RELATIONS_HEADERS)
					row.add(srcTable.get(row, EntityType.SOURCE+"-"+col));
				for(String col: ENTITY_CHANGES_HEADERS)
					row.add(srcTable.get(row, EntityType.SOURCE+"-"+col));

				for(String col: COVERRAGE_RELATIONS_HEADERS)
					row.add(clzTable.get(row, EntityType.CLAZZ+"-"+col));
				for(String col: ENTITY_CHANGES_HEADERS)
					row.add(clzTable.get(row, EntityType.CLAZZ+"-"+col));
				rows.put(ver, row);
			}

		}

		//create first row headers
		List<String> header = new ArrayList<>();
		header.add("TestSubject-Version");
		header.addAll(Arrays.asList(GENERAL_HEADERS));
		List<String >type = Arrays.asList(EntityType.STATEMENT.toString(),EntityType.SOURCE.toString(),EntityType.CLAZZ.toString());
		for(String t: type){
			for(String s :COVERRAGE_RELATIONS_HEADERS)
				header.add(t+"-"+s);
			for(String s :ENTITY_CHANGES_HEADERS)
				header.add(t+"-"+s);		
		}
		
		ResultOutput.outputResult("TestSubjectAnalysis", header, rows);
	}

	public static ArrayTable<String,String,String> analyzeGeneralInfo(Application testapp){
		ArrayTable<String,String,String> tablePerApp = ArrayTable.create(Arrays.asList(createAppVersionKeys(testapp)),Arrays.asList(GENERAL_HEADERS));
		for(int i=0;i<testapp.getTotalNumVersons();i++){ //one per row
			String rowKey = createAppVersionKey(testapp,i);
			tablePerApp.put(rowKey,GENERAL_HEADERS[0], //			"#of TestCases",
					testapp.getTestSuite().getTestCaseByVersion(i).size()+"");
			tablePerApp.put(rowKey,GENERAL_HEADERS[1], //			"#of Regression Test Cases (|T|)"
					testapp.getTestSuite().getRegressionTestCasesByVersion(i)+"");
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
		ArrayTable<String,String,String> tablePerApp = ArrayTable.create(Arrays.asList(createAppVersionKeys(testapp)),Arrays.asList(COVERRAGE_RELATIONS_HEADERS));
		CodeCoverage<Entity> lastVersionTrace = null;
		Set<String> entityUnionOfAllVersions = Sets.newHashSet();

		for(int i=0;i<testapp.getTotalNumVersons();i++){ //one per row
			String rowKey = createAppVersionKey(testapp,i);
			CodeCoverageAnalyzer cca =  CodeCoverageAnalyzerFactory.create(testapp.getRepository(),
					testapp,testapp.getProgram(ProgramVariant.orig, i),ts);
			//?cca2.extractEntities(EntityType.SOURCE);
			//?cca2.extractEntities(EntityType.CLAZZ);
			CodeCoverage<Entity> trace =  cca.createCodeCoverage(entityType);
			//factor1
			tablePerApp.put(rowKey, entityType+"-"+COVERRAGE_RELATIONS_HEADERS[0], //"Cumulative Coverage(CC)",
					trace.getCumulativeCoverage(ts.getRegressionTestCasesByVersion(i))+"");

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

			tablePerApp.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[1],//"#Covered Entity(Ec)",
					trace.getCoveredEntities().size()+"");

			tablePerApp.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[2],//"#Covered Entity(Ec) by Regression TC",
					trace.getCoveredEntities(ts.getRegressionTestCasesByVersion(i)).size()+"");

			List<String> changes = analyzeChanges(testapp,entityType,i,rowKey,trace);
			tablePerApp.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[3],//	"#Changed Entities(all)",
					changes.get(0));

			tablePerApp.put(rowKey, entityType+"-"+ENTITY_CHANGES_HEADERS[4],//	"#Changed Covered Entities", 
					changes.get(1));

			lastVersionTrace = trace; //keep it for next version
		}
		return tablePerApp;
	}

	private static List<String> analyzeChanges(Application testapp,EntityType entityType,int i,String rowKey,CodeCoverage<Entity> trace){
		List<String> changeResults = new ArrayList<>();
		//"#Changed Entities(all)",this would need to do change analysis
		String numChangedEntities = "N/A";
		String numChangedCoveredEntities = "N/A";
		Program p =testapp.getProgram(ProgramVariant.orig, i-1);
		Program pPrime = testapp.getProgram(ProgramVariant.orig, i);
		Set<Entity> modifiedEntity = Sets.newHashSet();
		if(i!=0){
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
				List<StatementEntity> modifiedStm = ca.getModifiedStatements();
				numChangedEntities = modifiedStm.size()+"";
				log.debug("modified statements in "+rowKey+ " total:" +  numChangedEntities + " : "+ modifiedStm);
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
			//up cast to Entity 
			Set<Entity> modifiedEntity2 = Sets.newHashSet(Iterables.transform(modifiedEntity, new Function<Entity,Entity>(){
				public Entity apply(Entity e){
					return (Entity)e;
				}
			}));

			//then intersec
			Set<Entity> changedCoveredEntity = Sets.intersection(
					Sets.newHashSet(trace.getCoveredEntities(testapp.getTestSuite().getRegressionTestCasesByVersion(i))),
					modifiedEntity2);
			numChangedCoveredEntities = changedCoveredEntity.size()+"";
			log.debug("modifed and covered "+entityType+" in "+ rowKey+ "total: " + numChangedCoveredEntities + " : "+changedCoveredEntity );
		}
		changeResults.add(numChangedEntities);
		changeResults.add(numChangedCoveredEntities);
		return changeResults;
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



