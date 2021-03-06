package uw.star.rts.extraction;

import static org.junit.Assert.*;

import java.nio.file.Path;

import org.junit.After;
import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.artifact.Application;
import uw.star.rts.artifact.CodeKind;
import uw.star.rts.artifact.ProgramVariant;
import uw.star.rts.artifact.TestSuite;
import uw.star.rts.artifact.TraceType;

public class SIRJavaFactoryTest_jacoco_core {
	static Application testapp;
	static SIRJavaFactory sir;
	static String appname = "jacoco_core";
    
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	  sir = new SIRJavaFactory();
	  sir.setExperimentRoot("/home/wliu/sir");
	  testapp = sir.extract(appname,TraceType.CODECOVERAGE_JACOCO);
	}

	@After
	public void tearDown() throws Exception {
	}


	@Test
	public void testExtractProgram() {

		assertEquals("orig has 14 version",14,testapp.getProgram(ProgramVariant.orig).size());
        assertEquals("#of .java files in orig v0", 152,testapp.getProgram(ProgramVariant.orig, 0).getCodeFiles(CodeKind.SOURCE).size());
        assertEquals("#of .class files in orig v0", 225,testapp.getProgram(ProgramVariant.orig, 0).getCodeFiles(CodeKind.BINARY).size());
        assertEquals("#of .java files in orig v13", 168,testapp.getProgram(ProgramVariant.orig, 13).getCodeFiles(CodeKind.SOURCE).size());
        assertEquals("#of .class files in orig v13", 255,testapp.getProgram(ProgramVariant.orig, 13).getCodeFiles(CodeKind.BINARY).size());
        
	}
	

	@Test 
	public void testExtractTests(){
		TestSuite ts = testapp.getTestSuite();
		assertEquals(807,ts.size());
		assertNotNull(ts.getTestCaseByName("org.jacoco.core.instr.InstrumenterTest.testInstrumentAll_Other"));
	}
}
