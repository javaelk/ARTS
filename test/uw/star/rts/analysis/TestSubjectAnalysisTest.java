package uw.star.rts.analysis;

import static org.junit.Assert.*;

import java.io.File;
import java.util.Arrays;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.artifact.Application;
import uw.star.rts.artifact.EntityType;
import uw.star.rts.artifact.TraceType;
import uw.star.rts.extraction.ArtifactFactory;
import uw.star.rts.extraction.SIRJavaFactory;
import uw.star.rts.util.Constant;
import uw.star.rts.util.PropertyUtil;

public class TestSubjectAnalysisTest {
	static String EXPERIMENT_ROOT;
	static ArtifactFactory af;
    static Application testapp;
    
	@BeforeClass
	public static void OneTimeSetup(){
		af =new SIRJavaFactory();
		EXPERIMENT_ROOT = PropertyUtil.getPropertyByName("config"+File.separator+"ARTSConfiguration.property",Constant.EXPERIMENTROOT);
		af.setExperimentRoot(EXPERIMENT_ROOT);		
		testapp = af.extract("jacoco_core",TraceType.CODECOVERAGE_JACOCO);
	}
	
	@Test
	public void test() {
        TestSubjectAnalysis.analyzeAllFactors(Arrays.asList(testapp));
	}

}
