package uw.star.rts.cost;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import uw.star.rts.analysis.*;
import uw.star.rts.artifact.*;
import ca.uwaterloo.uw.star.sts.schema.stStechniques.TechniqueDocument.Technique;

/**
 * An improved RW predictor incorporate information about modification
 * 
 * @see Reference paper: 
 * Harrold, M.J.; Rosenblum, D.; Rothermel, G.; Weyuker, E.; , 
 * "Empirical studies of a prediction model for regression test selection," 
 * Software Engineering, IEEE Transactions on , vol.27, no.3, pp.248-263, Mar 2001 doi: 10.1109/32.910860
 * 
 * @author Weining Liu
 *
 */
public class WeightedRWPrecisionPredictor extends RWPredictor {
	
	static Logger log =LoggerFactory.getLogger(WeightedRWPrecisionPredictor.class.getName());
	/**
	 * @param app
	 * @return the percentage of test case of T that the RW predictor predicts will be selected by technique teq 
	 *         when an arbitary changes is made to P 
	 */
	public static double predictSelectionRate(CodeCoverage cover,List<TestCase> regressionTestcases){
		//		total number of test cases covered by ej *		weight of ej
		double wncm=0.0;
		for(Object ej: cover.getCoveredEntities()){
			log.debug("covered entity " + ((SourceFileEntity)ej).getName() );
			for(Object tc: cover.getLinkedEntitiesByColumn((Entity)ej)){   //find all test cases covers this entity ej
				log.debug("test case " + (TestCase)tc);
				if(regressionTestcases.contains((TestCase)tc)){
					log.debug("add " + ((SourceFileEntity)ej).getChangeFrequency());
					wncm += ((SourceFileEntity)ej).getChangeFrequency();
				}else{
					log.debug("test case " + (TestCase)tc + " is not a regression test case");
				}
			}
		}
		log.debug("wncm = " + wncm);
		double pim = wncm/regressionTestcases.size();
		return pim;
	}
}
