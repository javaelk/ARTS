package uw.star.rts.analysis;

import static org.junit.Assert.*;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.junit.BeforeClass;
import org.junit.Test;

public class GoogleJavaParserTest {

	Path test1 = Paths.get("test"+File.separator+"testfiles"+File.separator+"JaCoCoTest.java.txt");
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
	}

	@Test
	public void extractMethodNametest() {
		GoogleJavaParser jp = new GoogleJavaParser(null,null);
		System.out.println(jp.extractMethodName(test1));
		
	}

}
