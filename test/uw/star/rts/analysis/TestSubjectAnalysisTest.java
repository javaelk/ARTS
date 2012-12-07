package uw.star.rts.analysis;

import static org.junit.Assert.*;

import java.nio.file.Paths;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.artifact.Application;
import uw.star.rts.main.Engine;

public class TestSubjectAnalysisTest {

	static List<Application> testSubjects; 
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Engine.getInputFiles("config/ARTSConfiguration.property");
		testSubjects =Engine.extractInfoFromRepository(Paths.get("config/CaseStudySubject_test.xml"));
	}

	@Test
	public void testAnalyze() {
		TestSubjectAnalysis.analyzeCoverageStability(testSubjects);
	}

}
