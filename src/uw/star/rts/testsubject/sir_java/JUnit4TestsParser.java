package uw.star.rts.testsubject.sir_java;

import java.nio.file.Path;
import java.util.List;

public interface JUnit4TestsParser {
	//parse from an entire folder
     public List<String> getJUnit4TestMethodsFromFolder(Path testFileFolder);
     //parse one file only
     public List<String> getJUnit4TestMethodsFromFile(Path testFile);
   //parse from an entire folder
     public List<String> getJUnit4TestClassesFromFolder(Path testFileFolder);
     //parse one file only
     public List<String> getJUnit4TestClassesFromFile(Path testFile);
}
