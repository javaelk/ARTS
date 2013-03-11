package uw.star.rts.internal;


import org.junit.runners.model.FrameworkMethod;
import org.junit.runners.model.TestClass;
import uw.star.rts.util.FileUtility;
import java.nio.file.Path;

/*
 * this class traverse all classes in a given path and find out all Junit test classes and methods
 * 
 */
import java.util.List;

public class JUnit4TestsVisitor {

	Path codePath;
	/**
	 * Constructor , code path to .java or .class?
	 */
	JUnit4TestsVisitor(Path codePath){
		//TODO: Validate path
		this.codePath= codePath;
	}
	
	public static void main(String[] args){
		TestClass testClass = new TestClass(uw.star.rts.artifact.TestCaseTest.class);
		List<FrameworkMethod> testMethods = testClass.getAnnotatedMethods(org.junit.Test.class);
		for(FrameworkMethod m: testMethods)
			System.out.println(m.getName());
	}
	/**
	 * 
	 * @return a list of all JUnit4 test class fully qualified names
	 */
	public List<String> getJUnit4TestClassNames(){
		
		//for(Path classfile: FileUtility.findFiles(codePath, ".class")){}
		 

		return null;
	}
	
	/*
	 * @return a list of all JUnit4 test method names
	 */
	public List<String> getJUnit4TestMethodNames(){
	 return null;	
	}
}
