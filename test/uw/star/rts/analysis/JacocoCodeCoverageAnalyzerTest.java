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
	}

	@Test
	public void testParseSourceFile() {
        List srcEntites = analyzer.extractEntities(EntityType.SOURCE);
		List classEntities = analyzer.extractEntities(EntityType.CLAZZ);
		List methodEntities = analyzer.extractEntities(EntityType.METHOD);
		List stmEntities = analyzer.extractEntities(EntityType.STATEMENT);
		assertEquals(121,srcEntites.size());
		assertEquals(175,classEntities.size());
		assertEquals(1577,methodEntities.size());
		assertEquals(9467,stmEntities.size());
	}

}
