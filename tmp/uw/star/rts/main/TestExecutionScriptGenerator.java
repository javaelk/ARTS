package uw.star.rts.main;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class TestExecutionScriptGenerator {
   public static void main(String[] args){
	   Path testplanScript = Paths.get("/home/wliu/sir/jacoco_core/testplans.alt/v0/v0.class.junit.universe.all");
	   try(BufferedReader reader = Files.newBufferedReader(testplanScript, StandardCharsets.ISO_8859_1)){
		   String line =null;
		   int counter =1;
		   while((line=reader.readLine())!=null){
			   String testcaseName = line.split("\\[")[1].split("\\]")[0];
			   System.out.println("echo \" running test "+ counter +"\"");
			   System.out.println("java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar SingleJUnitTestRunner "+testcaseName + "> $experiment_root/$TESTSUBJECT/outputs/t1 2>&1");
			   System.out.println("$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh " + testcaseName+"\n");
			   counter++;
		   }
	   }catch(IOException e){
		   e.printStackTrace();
	   }
 
	   
   }
}
