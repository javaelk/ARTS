package uw.star.rts.analysis;

import static org.junit.Assert.*;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

public abstract class AbstractParserTest {
	
	Path test1 = Paths.get("/home/wliu/sir/jacoco_core/versions.alt/orig/v0/jacoco_core/build/src/testcases");
	static JUnit4TestsParser parser;

	@Test
	public void testjunit4TestMethodParser(){
		String test = "test"+File.separator+"testfiles"+File.separator+"JaCoCoTest.java.txt";
		List<String> methods = parser.getJUnit4TestMethodsFromFile(Paths.get(test));
		assertEquals(3,methods.size());
		assertTrue(methods.contains("testVERSION"));
		assertTrue(methods.contains("testHOMEURL"));
		assertTrue(methods.contains("testRUNTIMEPACKAGE"));
	}

	@Test
	public void testjunit4TestMethodParser1(){
		String test1 = "test"+File.separator+"testfiles"+File.separator+"JaCoCoTest1.java.txt";
		List<String> methods = parser.getJUnit4TestMethodsFromFile(Paths.get(test1));
		assertEquals(2,methods.size());
		assertFalse(methods.contains("testVERSION"));
		assertTrue(methods.contains("testHOMEURL"));
		assertTrue(methods.contains("testRUNTIMEPACKAGE"));
	}

	@Test
	public void testjunit4TestMethodParser2(){
		String test2 = "test"+File.separator+"testfiles"+File.separator+"JaCoCoTest2.java.txt";
		List<String> methods = parser.getJUnit4TestMethodsFromFile(Paths.get(test2));
		assertEquals(2,methods.size());
		assertTrue(methods.contains("testVERSION"));
		assertTrue(methods.contains("testHOMEURL"));
		assertFalse(methods.contains("testRUNTIMEPACKAGE"));
	}

	@Test
	public void testjunit4TestMethodParser3(){
		String test3 = "test"+File.separator+"testfiles"+File.separator+"JaCoCoTest3.java.txt";
		List<String> methods = parser.getJUnit4TestMethodsFromFile(Paths.get(test3));
		assertEquals(2,methods.size());
		assertTrue(methods.contains("testVERSION"));
		assertTrue(methods.contains("testHOMEURL"));
		assertFalse(methods.contains("testRUNTIMEPACKAGE"));
	}

}
