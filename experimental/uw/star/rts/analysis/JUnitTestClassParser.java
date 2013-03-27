package uw.star.rts.analysis;

import java.lang.reflect.Modifier;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import org.junit.runners.model.FrameworkMethod;
import org.junit.runners.model.TestClass;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import uw.star.rts.util.FileUtility;
import uw.star.rts.util.JavaFileParser;

/**
 * This class utilize Junit testclass and FrameworkMethod to parse all JUnit4 test methods. It need access to both source and class files.
 * It requires test subjects' test classes in the current Classpath
 * @author wliu
 *
 */
public class JUnitTestClassParser implements JUnit4TestsParser{
    /**
     * this should find out all junit4 test methods
     * @param javafile
     * @return
     */
	static Logger log = LoggerFactory.getLogger(JUnitTestClassParser.class.getName());
	@Override
	public List<String> getJUnit4TestMethodsFromFile(Path javafile){
		//todo: draw back of this solution is test classes of test subjects have to be on ARTS classpath now! 
		List<String> resultLst = new ArrayList<>();
		String className = javafile.getFileName().toString().split("\\.")[0];
		String packageName = JavaFileParser.getJavaPackageName(javafile);
		try {
			//log.debug("test class - " + packageName + "."+className);
			TestClass testClass = new TestClass(Class.forName(packageName+"."+className));
           
			//BUG fix, skip for abstract class
			if(isAbstract(testClass))
				return resultLst;
			List<FrameworkMethod> testMethods = testClass.getAnnotatedMethods(org.junit.Test.class);
			for(FrameworkMethod m: testMethods)
				resultLst.add(packageName + "." + className+"."+m.getName());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e){
			//log.error(className + "is not a test class");
		}
        return resultLst;
	}
	@Override
	public List<String> getJUnit4TestMethodsFromFolder(Path testFileFolder) {
		List<String> methods1 = new ArrayList<>();
		List<Path> junitTestFiles = FileUtility.findFiles(testFileFolder, "*.java");
		for(Path junit: junitTestFiles)
		    methods1.addAll(getJUnit4TestMethodsFromFile(junit));
		return methods1;
	}
	/**
	 * check whether a junit test class is abstract 
	 * @param junitTestClass
	 * @return
	 */
	private boolean isAbstract(TestClass junitTestClass){
		return Modifier.isAbstract(junitTestClass.getJavaClass().getModifiers());
	}
	

}
