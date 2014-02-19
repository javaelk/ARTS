package uw.star.rts.util;

import static org.junit.Assert.*;

import java.io.File;
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
	

}
