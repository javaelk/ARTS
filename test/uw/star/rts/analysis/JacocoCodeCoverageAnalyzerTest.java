package uw.star.rts.analysis;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.artifact.*;
import uw.star.rts.extraction.ArtifactFactory;
import uw.star.rts.extraction.SIRJavaFactory;

import java.io.File;
import java.nio.file.*;
import java.util.List;
public class JacocoCodeCoverageAnalyzerTest {
	
	static Application app;
	static ArtifactFactory af;
	static Program p;
	static JacocoCodeCoverageAnalyzer analyzer;
	static Path testxml;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		af =new SIRJavaFactory();
		af.setExperimentRoot("/home/wliu/sir");
		app = af.extract("apache-ant");
		p=app.getProgram(ProgramVariant.orig, 0);
		analyzer = new JacocoCodeCoverageAnalyzer(af,app,p,app.getTestSuite());
       testxml = Paths.get("test"+File.separator+"testfiles"+File.separator+"coverage.org.apache.tools.ant.IntrospectionHelperTest.testAddText.xml");
       analyzer.parseJacocoXMLReport(testxml);
	}

	@Test
	public void testParseEntities() {
		assertEquals(121,analyzer.srcEntities.size());
		assertEquals(175,analyzer.classEntities.size());
		assertEquals(1577,analyzer.methodEntities.size());
		assertEquals(9467,analyzer.stmEntities.size());
		assertEquals(12,analyzer.coveredClassEntities.size());
		assertEquals(21,analyzer.coveredMethodEntities.size());
		assertEquals(3,analyzer.coveredSrcEntities.size());
		assertEquals(90,analyzer.coveredStmEntities.size());
	}
	
	@Test
	public void testCreateCodeCoverage(){
		TestCase t0 = app.getTestSuite().getTestCaseByName(analyzer.extractTestCaseName(testxml));
		TestCase t1= app.getTestSuite().getTestCaseByName("org.apache.tools.ant.taskdefs.DeleteTest.test1");
		Trace clazztrace = analyzer.createCodeCoverage(EntityType.CLAZZ);
		clazztrace.serializeCompressedMatrixToCSV(Paths.get("output","classtrace.csv"));
		assertEquals("test # of covered clazz by t0",12,clazztrace.getLinkedEntitiesByRow(t0).size());
		assertEquals("test # of covered clazz by t1",33,clazztrace.getLinkedEntitiesByRow(t1).size());
		Trace methodtrace = analyzer.createCodeCoverage(EntityType.METHOD);
		methodtrace.serializeCompressedMatrixToCSV(Paths.get("output","methodtrace.csv"));
		assertEquals("test # of covered method by t0",21,methodtrace.getLinkedEntitiesByRow(t0).size());
		assertEquals("test # of covered method by t1",127,methodtrace.getLinkedEntitiesByRow(t1).size());
		Trace srctrace = analyzer.createCodeCoverage(EntityType.SOURCE);
		srctrace.serializeCompressedMatrixToCSV(Paths.get("output","sourcetrace.csv"));
		assertEquals("test # of covered source by t0",3,srctrace.getLinkedEntitiesByRow(t0).size());
		assertEquals("test # of covered source by t1",22,srctrace.getLinkedEntitiesByRow(t1).size());
		Trace stmtrace = analyzer.createCodeCoverage(EntityType.STATEMENT);
		stmtrace.serializeCompressedMatrixToCSV(Paths.get("output","stmtrace.csv"));
		assertEquals("test # of covered method by t0",90,stmtrace.getLinkedEntitiesByRow(t0).size());
		assertEquals("test # of covered method by t1",550,stmtrace.getLinkedEntitiesByRow(t1).size());
	}

}
