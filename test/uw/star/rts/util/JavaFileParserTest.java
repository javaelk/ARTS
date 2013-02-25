package uw.star.rts.util;

import static org.junit.Assert.*;

import java.io.File;
import java.util.List;

import org.junit.Test;

import uw.star.rts.util.JavaFileParser;

public class JavaFileParserTest {

	@Test
	public void testGetJavaPackageName(){
		String fileName = "/home/wliu/sir/jakarta-jmeter/versions.alt/orig/v0/JMeter/build/src/functions/org/apache/jmeter/functions/ThreadNumber.java";
		assertEquals("package name", "org.apache.jmeter.functions", JavaFileParser.getJavaPackageName(fileName));
	}

	@Test 
	public void testIsInterface(){
		String fileName = "test"+File.separator+"testfiles"+File.separator+"XSLTLiaison.java.txt";
		assertTrue("in interface",JavaFileParser.isInterface(fileName));
	}

	@Test
	public void testjunit4TestMethodParser(){
		String test = "test"+File.separator+"testfiles"+File.separator+"JaCoCoTest.java.txt";
		List<String> methods = JavaFileParser.junit4TestMethodParser(test);
		assertEquals(3,methods.size());
		assertTrue(methods.contains("testVERSION"));
		assertTrue(methods.contains("testHOMEURL"));
		assertTrue(methods.contains("testRUNTIMEPACKAGE"));
	}

	@Test
	public void testjunit4TestMethodParser1(){
		String test1 = "test"+File.separator+"testfiles"+File.separator+"JaCoCoTest1.java.txt";
		List<String> methods = JavaFileParser.junit4TestMethodParser(test1);
		assertEquals(2,methods.size());
		assertFalse(methods.contains("testVERSION"));
		assertTrue(methods.contains("testHOMEURL"));
		assertTrue(methods.contains("testRUNTIMEPACKAGE"));
	}

	@Test
	public void testjunit4TestMethodParser2(){
		String test2 = "test"+File.separator+"testfiles"+File.separator+"JaCoCoTest2.java.txt";
		List<String> methods = JavaFileParser.junit4TestMethodParser(test2);
		assertEquals(2,methods.size());
		assertTrue(methods.contains("testVERSION"));
		assertTrue(methods.contains("testHOMEURL"));
		assertFalse(methods.contains("testRUNTIMEPACKAGE"));
	}

	@Test
	public void testjunit4TestMethodParser3(){
		String test3 = "test"+File.separator+"testfiles"+File.separator+"JaCoCoTest3.java.txt";
		List<String> methods = JavaFileParser.junit4TestMethodParser(test3);
		assertEquals(2,methods.size());
		assertTrue(methods.contains("testVERSION"));
		assertTrue(methods.contains("testHOMEURL"));
		assertFalse(methods.contains("testRUNTIMEPACKAGE"));
	}

}
