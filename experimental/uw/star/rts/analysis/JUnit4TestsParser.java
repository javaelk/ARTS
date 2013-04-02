package uw.star.rts.analysis;

import java.nio.file.Path;
import java.util.List;

public interface JUnit4TestsParser {
	//parse from an entire folder
     public List<String> getJUnit4TestMethodsFromFolder(Path testFileFolder);
     //parse one file only
     public List<String> getJUnit4TestMethodsFromFile(Path testFileFolder);
}