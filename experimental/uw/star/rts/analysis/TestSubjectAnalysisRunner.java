package uw.star.rts.analysis;

import java.nio.file.Paths;
import java.util.List;
import uw.star.rts.artifact.Application;
import uw.star.rts.main.Engine;

public class TestSubjectAnalysisRunner {

	static List<Application> testSubjects; 
	public static void main(String[] args){
		Engine.getInputFiles("config/ARTSConfiguration.property");
		testSubjects =Engine.extractInfoFromRepository(Paths.get("experimental/CaseStudySubject_test.xml"));
		TestSubjectAnalysis.analyzeCoverageStability(testSubjects);
	}
}
