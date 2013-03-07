package uw.star.rts.extraction;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.artifact.Application;
import uw.star.rts.artifact.CodeKind;
import uw.star.rts.artifact.ProgramVariant;

public class SIRJavaFactoryTest_jacoco_core_snapshots {
	static Application testapp;
	static SIRJavaFactory sir;
	static String appname = "jacoco_core_snapshots";
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		  sir = new SIRJavaFactory();
		  sir.setExperimentRoot("/home/wliu/sir");
	}

	@Test
	public void testExtractProgram2() {
		 testapp = sir.extract(appname);
		assertEquals("orig has 20 version",20,testapp.getProgram(ProgramVariant.orig).size());
        assertEquals("#of .java files in orig v0", 168,testapp.getProgram(ProgramVariant.orig, 0).getCodeFiles(CodeKind.SOURCE).size());
        assertEquals("#of .class files in orig v0", 255,testapp.getProgram(ProgramVariant.orig, 0).getCodeFiles(CodeKind.BINARY).size());
        assertEquals("#of .java files in orig v19", 168,testapp.getProgram(ProgramVariant.orig, 19).getCodeFiles(CodeKind.SOURCE).size());
        assertEquals("#of .class files in orig v19", 255,testapp.getProgram(ProgramVariant.orig, 19).getCodeFiles(CodeKind.BINARY).size());
        
	}

}
