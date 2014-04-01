package uw.star.rts.util;

import static org.junit.Assert.*;

import java.io.File;
import java.util.List;

import org.junit.Test;

import uw.star.rts.util.JavaFileParser;

public class JavaFileParserTest {

	@Test
	public void testGetJavaPackageName(){
		String fileName = "test"+File.separator+"testfiles"+File.separator+"ThreadNumber.java";
		assertEquals("package name", "org.apache.jmeter.functions", JavaFileParser.getJavaPackageName(fileName));
	}

	@Test 
	public void testIsInterface(){
		String fileName = "test"+File.separator+"testfiles"+File.separator+"XSLTLiaison.java";
		assertTrue("in interface",JavaFileParser.isInterface(fileName));
	}
	
	@Test
	public void testNonJavaFile(){
		String fileName = "test/testfiles/JaCoCoTest.java.txt";
		assertTrue(JavaFileParser.getJavaPackageName(fileName)==null);
	}
}
