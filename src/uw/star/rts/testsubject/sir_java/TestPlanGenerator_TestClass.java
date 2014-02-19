package uw.star.rts.testsubject.sir_java;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import uw.star.rts.util.QDoxJavaParser;


public class TestPlanGenerator_TestClass {
	public static void main(String[] args){
		Path testcaseSrcDir = Paths.get(args[0]);
		//method 2 - use QDox
		QDoxJavaParser qparser = new QDoxJavaParser();
		List<String> methods2 =qparser.getJUnit4TestClassesFromFolder(testcaseSrcDir); 

			for(String m: methods2)
				System.out.println("-P["+m+"]");
	}
}
