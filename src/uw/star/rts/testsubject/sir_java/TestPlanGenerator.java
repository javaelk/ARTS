package uw.star.rts.testsubject.sir_java;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import uw.star.rts.util.*;

import com.google.common.collect.*;
/**
 * this is one time use to generate a test plan universal file, generate test methods as test case
 * @author wliu
 *
 */
public class TestPlanGenerator {
	public static void main(String[] args){
		//Path testcaseSrcDir = Paths.get("/home/wliu/sir/jacoco_core/versions.alt/orig/v1/jacoco_core/build/src/testcases");
		Path testcaseSrcDir = Paths.get(args[0]);
		
		boolean USEQDOXONLY = true;
		//Path testcaseClassDir = Paths.get("/home/wliu/sir/jacoco_core/versions.alt/orig/v0/jacoco_core/build/testcases");
		//Path mainClassDir = Paths.get("/home/wliu/sir/jacoco_core/versions.alt/orig/v0/jacoco_core/build/classes");

		
		//method 2 - use QDox
		QDoxJavaParser qparser = new QDoxJavaParser();
		List<String> methods2 =qparser.getJUnit4TestMethodsFromFolder(testcaseSrcDir); 
		
		if(!USEQDOXONLY){
		// method 1 - use junit4
		JUnitTestClassParser jparser = new JUnitTestClassParser();
		List<String> methods1 = jparser.getJUnit4TestMethodsFromFolder(testcaseSrcDir);
		//compare
		Sets.SetView<String> sv = Sets.difference(Sets.newHashSet(methods1), Sets.newHashSet(methods2));
		if(sv.size()==0){//same
			for(String m: methods1)
				System.out.println("-P["+m+"]");
		}else{
			for(String s : Sets.difference(Sets.newHashSet(methods1), Sets.newHashSet(methods2)))
				System.out.println("diff - " + s);
		}}
		else{
			for(String m: methods2)
				System.out.println("-P["+m+"]");
		}
	}
}
