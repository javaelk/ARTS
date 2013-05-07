package uw.star.rts.testsubject.sir_java;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

//generate most of the testexecution script based on testplan script

public class TestExecutionScriptGenerator {
	public static void main(String[] args){
		for(int i=0;i<9;i++){
			Path testplanScript = Paths.get("/home/wliu/sir/jacoco_core_snapshots-TC/testplans.alt/v"+i+"/v"+i+".class.junit.universe.all");
			Path testExecutionScript = Paths.get("/home/wliu/sir/jacoco_core_snapshots-TC/scripts/TestScripts/scriptR"+i+"coverage.cls");
			System.out.println("read from " + testplanScript + " to generate file " +testExecutionScript);
			
			try(BufferedReader reader = Files.newBufferedReader(testplanScript, StandardCharsets.ISO_8859_1)){
				String line =null;
				int counter =1;
				try(BufferedWriter writter = Files.newBufferedWriter(testExecutionScript, StandardCharsets.ISO_8859_1)){
					while((line=reader.readLine())!=null){
						String testcaseName = line.split("\\[")[1].split("\\]")[0];
						writter.write("echo \" running test "+ counter +"\""+"\n");
						writter.write("java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore "+testcaseName + "> $experiment_root/$TESTSUBJECT/outputs/t"+counter+" 2>&1"+"\n" );
						writter.write("$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh " + testcaseName+ " $VER"+"\n\n");
						counter++;
					}
				}catch(IOException e){
					e.printStackTrace();
				}
			}catch(IOException e){
				e.printStackTrace();
			}

		}
	}
}