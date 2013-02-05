package uw.star.rts.cost;

import uw.star.rts.artifact.*;

import java.util.*;

import org.slf4j.*;

import ca.uwaterloo.uw.star.sts.schema.stStechniques.TechniqueDocument.Technique;

/**
 * Implementation of Rosenblum-Weyuker Cost Predictor
 * Reference Paper: 
 * D.S. Rosenblum and E.J. Weyuker, "Using Coverage Information
 * to Predict the Cost-Effectiveness of Regression Testing Strategies",
 * IEEE Trans. Software Eng., vol. 23, no. 3, pp. 146-156, Mar. 1997.
 * 
 * This Predictor modifies RWPrecisionPredictor to consider changed entities that are not covered by any test cases
 * @author Weining Liu
 * @version 2012-11-28
 *
 */

public class RWPrecisionPredictor3 {
	static Logger log =LoggerFactory.getLogger(RWPrecisionPredictor3.class.getName());
	/**
	 * PIm = k * CC/ |E||T|
	 * The fraction of the test suite that needs to be rerun is called PIm
	 * PIm equals number of entity changes * cumulative coverage / (size of entities * size of test suite)
	 * 
	 * @param 
	 * @return the percentage of test case of T that the RW predictor predicts will be selected by technique teq 
	 *         when an arbitrary changes is made to P 
	 */

	public static double predictSelectionRate(CodeCoverage cover,List<TestCase> testcases,int k){
//		calculate cc and ec based on given testcases only(regression tests)
		double cc=0.0;
		Set coveredEntities = new HashSet();
		List linkedEntities = null;
		for(TestCase test: testcases){
		   linkedEntities = cover.getLinkedEntitiesByRow(test);
		   cc += linkedEntities.size();
		   coveredEntities.addAll(linkedEntities);
		}
		log.debug("Cumlative Coverage is " + cc);
		int e = cover.getColumns().size(); //column is entity
		log.debug("Total num of entities is " + e);
		int t = testcases.size();
		log.debug("Test case size is " + t);
		double pim = (k*1.0*cc)/(e*t);
		return pim;
	}
	
	/**
	 * Prediction Procedure
	 *  M is cost effective if Sm|Tm| < r(|T| - |Tm|)
	 */
	
	public static boolean  isCostEffective(TestSuite t, TestSuite tm, int versionNum, Technique m){
		//TODO:implement me! 
		return true;
	}
}
