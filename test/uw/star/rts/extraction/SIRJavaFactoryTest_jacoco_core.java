package uw.star.rts.extraction;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.artifact.Application;
import uw.star.rts.artifact.CodeKind;
import uw.star.rts.artifact.ProgramVariant;

public class SIRJavaFactoryTest_jacoco_core {
	static Application testapp;
	static SIRJavaFactory sir;
	static String appname = "jacoco_core";
    
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	  sir = new SIRJavaFactory();
	  sir.setExperimentRoot("/home/wliu/sir");

	}

	@After
	public void tearDown() throws Exception {
	}


	@Test
	public void testExtractProgram() {
		 testapp = sir.extract(appname);
		assertEquals("orig has 1 version",1,testapp.getProgram(ProgramVariant.orig).size());
        assertEquals("#of .java files in orig v0", 169,testapp.getProgram(ProgramVariant.orig, 0).getCodeFiles(CodeKind.SOURCE).size());
        assertEquals("#of .class files in orig v0", 263,testapp.getProgram(ProgramVariant.orig, 0).getCodeFiles(CodeKind.BINARY).size());
	}
}
