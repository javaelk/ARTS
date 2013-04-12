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
 * This Predictor predicts selection rate of k number of entities changed. 
 * i.e. coverage incurred by obsolete test cases are removed.
 * @author Weining Liu
 * @version 2012-11-30
 *
 */

public class RWPredictor_multiChanges {
	static Logger log =LoggerFactory.getLogger(RWPredictor_multiChanges.class.getName());
	/**
	 * @see paper section 3.3 
	 * @return the percentage of test case of T that the RW predictor predicts will be selected by technique  
	 *         when k number of changes is made to P 
	 */

	public static double predictSelectionRate(int ec,int k){
		double pim = ((k*1.0)/ec)*(((2*ec-k-1)*1.0)/(ec-1));
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
