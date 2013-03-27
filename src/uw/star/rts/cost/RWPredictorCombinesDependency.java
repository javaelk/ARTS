package uw.star.rts.cost;
//todo: framework code should not import / dependent on technique code 
import uw.star.rts.analysis.DependencyAnalyzer_C2CInboundTransitive;
import uw.star.rts.artifact.*;

import java.util.*;

import org.slf4j.*;

import ca.uwaterloo.uw.star.sts.schema.stStechniques.TechniqueDocument.Technique;

/**
 * modification of Rosenblum-Weyuker Cost Predictor
 * Reference Paper: 
 * D.S. Rosenblum and E.J. Weyuker, "Using Coverage Information
 * to Predict the Cost-Effectiveness of Regression Testing Strategies",
 * IEEE Trans. Software Eng., vol. 23, no. 3, pp. 146-156, Mar. 1997.
 * 
 * This Predictor modifies RWPrecisionPredictor to merge class dependency information into code coverage matrix
 * @author Weining Liu
 * @version 2013-02-10
 *
 */

public class RWPredictorCombinesDependency {
	static Logger log =LoggerFactory.getLogger(RWPredictorCombinesDependency.class.getName());
	/**
	 * PIm = k * CC/ |E||T|
	 * The fraction of the test suite that needs to be rerun is called PIm
	 * PIm equals number of entity changes * cumulative coverage / (size of entities * size of test suite)
	 * 
	 * @param 
	 * @return the percentage of test case of T that the RW predictor predicts will be selected by technique teq 
	 *         when an arbitrary changes is made to P 
	 */

	public static double predictSelectionRate(Program p, CodeCoverage<ClassEntity> cc,List<TestCase> regressionTests){
		
		//merge dependent information into cc before pass to predictor,

        /**
         * for each entity e in coverage matrix
         *    find all entities dependents on e (inbound dependent)  - eDependents
         *    for each entity e' in eDependent
         *       merge test cases covers e' into e
         *    end of for
         *  end of for  
         */
        DependencyAnalyzer_C2CInboundTransitive dp = new DependencyAnalyzer_C2CInboundTransitive();
        dp.analyze(p);
        for(ClassEntity ce : cc.getColumns()){
        	List<String> eDependent = dp.findDirectAndTransitiveInBoundDependentClasses(ce.getName());
        	cc.transform(ce,eDependent);
        }
       //predictor2 with new transformed cc 
       return RWPrecisionPredictor2.predictSelectionRate(cc,regressionTests);
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
