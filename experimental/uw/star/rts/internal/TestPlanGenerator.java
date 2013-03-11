package uw.star.rts.internal;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import uw.star.rts.util.*;

/**
 * this is one time use to generate a test plan universal file
 * TODO:This doesn't seem to be able to handle test classes extends super test class but has no @Test in it. need manual update to fix those scenarios
 * @author wliu
 *
 */
public class TestPlanGenerator {
	public static void main(String[] args){
		Path junitDir = Paths.get("/home/wliu/sir/jacoco_core/versions.alt/orig/v0/jacoco_core/build/src/testcases");
		List<Path> junitTestFiles = FileUtility.findFiles(junitDir, "*.java");
		// print package name, class name, test method name
		for(Path junit: junitTestFiles){
		    String packageName = JavaFileParser.getJavaPackageName(junit);
		    String className = junit.getFileName().toString();
		    for(String methodName : JavaFileParser.junit4TestMethodParser(junit))
        		 System.out.println("-P["+packageName+"."+className.substring(0, className.lastIndexOf(".java"))+"."+ methodName+"]");
		}
	}
}
