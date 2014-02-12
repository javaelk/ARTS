package uw.star.rts.main;

import java.util.List;
import uw.star.rts.analysis.TestSubjectAnalysis;
import uw.star.rts.artifact.Application;

public class TestSubjectAnalysisRunner {

	static List<Application> testSubjects; 
	public static void main(String[] args){
		Engine.getInputFiles(args[0]);
		testSubjects =Engine.extractInfoFromRepository(Engine.CaseStudySubject);
		TestSubjectAnalysis.analyzeAllFactors(testSubjects);
	}
}
