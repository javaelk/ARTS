package uw.star.rts.analysis;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import uw.star.rts.artifact.Application;
import uw.star.rts.artifact.Program;
import uw.star.rts.artifact.TestSuite;
import uw.star.rts.artifact.TraceType;
import uw.star.rts.extraction.ArtifactFactory;


/**
 * This factory class creates concrete analyzer object based on trace type of test subjects
 * @author wliu
 *
 */
public class CodeCoverageAnalyzerFactory {
	static Logger log = LoggerFactory.getLogger(CodeCoverageAnalyzerFactory.class.getName());
	/**
	 * Create a analyzer object based on application's trace type 
	 * @return
	 */
	public static CodeCoverageAnalyzer create(ArtifactFactory af, Application testapp, Program p,TestSuite testSuite){
		TraceType traceType = testapp.getTraceType(); 
		switch (traceType){
		case CODECOVERAGE_EMMA:
			return new EmmaCodeCoverageAnalyzer(af,testapp,p,testSuite);
		
		case CODECOVERAGE_JACOCO:
			return new JacocoCodeCoverageAnalyzer(af,testapp,p,testSuite);
		
		default: 
			log.error("Unknown trace type" + traceType);
			return null;
		}
		
	}

}
