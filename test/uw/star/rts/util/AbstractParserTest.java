package uw.star.rts.util;

import static org.junit.Assert.*;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.util.JUnit4TestsParser;

public abstract class AbstractParserTest {
	
	static JUnit4TestsParser parser;

	@Test
	public void testjunit4TestMethodParser(){
		String test = "test"+File.separator+"testfiles"+File.separator+"JaCoCoTest.java.txt";
		List<String> methods = parser.getJUnit4TestMethodsFromFile(Paths.get(test));
		assertEquals(3,methods.size());
		assertTrue(methods.contains("org.jacoco.core.JaCoCoTest.testVERSION"));
		assertTrue(methods.contains("org.jacoco.core.JaCoCoTest.testHOMEURL"));
		assertTrue(methods.contains("org.jacoco.core.JaCoCoTest.testRUNTIMEPACKAGE"));
	}

	@Test
	public void testjunit4TestClassParser(){
		String test = "test"+File.separator+"testfiles"+File.separator+"JaCoCoTest.java.txt";
		List<String> clazz = parser.getJUnit4TestClassesFromFile(Paths.get(test));
		assertEquals(1,clazz.size());
		assertTrue(clazz.contains("org.jacoco.core.JaCoCoTest"));

	}
}
