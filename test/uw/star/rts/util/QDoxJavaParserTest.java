package uw.star.rts.util;

import static org.junit.Assert.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.util.JavaFileParser;
import uw.star.rts.util.QDoxJavaParser;

public class QDoxJavaParserTest{ 

	static QDoxJavaParser parser;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		parser = new QDoxJavaParser();
	}


	@Test
	public void testGetClassesFromSource(){
		List<String> clazz = parser.getClassesFromSource(Paths.get("test/testfiles/ValueSourceParser.java"));
		assertTrue(clazz.contains("org.apache.solr.search.NamedParser"));
		List<String> clazz2 = parser.getClassesFromSource(Paths.get("test/testfiles/ClassInstrumenter.java"));
		System.out.println(clazz2);
	}

	@Test
	public void testGetAnnotation(){
		List<String> testMethods = parser.getJUnit4TestMethodsFromFile(Paths.get("test/testfiles/DisMaxRequestHandlerTest.java"));
		assertTrue(testMethods.contains("org.apache.solr.DisMaxRequestHandlerTest.testSomeStuff"));

	}

	@Test
	public void testGetJavaPackageName(){
		try{
			assertEquals("org.apache.solr.search",QDoxJavaParser.getJavaPackageName("test/testfiles/ValueSourceParser.java"));
			assertEquals("org.apache.solr.search",QDoxJavaParser.getJavaPackageName("test/testfiles/ValueSourceParser1.java"));
			assertEquals("",QDoxJavaParser.getJavaPackageName("test/testfiles/ValueSourceParser2.java"));
			String fileName = "test"+File.separator+"testfiles"+File.separator+"ThreadNumber.java";
			assertEquals("package name", "org.apache.jmeter.functions", QDoxJavaParser.getJavaPackageName(fileName));
		}catch(JavaParsingException e){
			e.printStackTrace();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
	}

	@Test 
	public void testIsInterface(){
		try{
			String fileName = "test"+File.separator+"testfiles"+File.separator+"XSLTLiaison.java";
			assertTrue("in interface",QDoxJavaParser.isInterface(fileName));

		}catch(JavaParsingException e){
			e.printStackTrace();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
	}
	
	
}
