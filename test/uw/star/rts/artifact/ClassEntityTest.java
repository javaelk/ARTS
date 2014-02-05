package uw.star.rts.artifact;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.analysis.CodeCoverageAnalyzer;
import uw.star.rts.analysis.CodeCoverageAnalyzerFactory;
import uw.star.rts.extraction.ArtifactFactory;
import uw.star.rts.extraction.SIRJavaFactory;

public class ClassEntityTest {
    static Program p;
	@BeforeClass
	public static void oneTimeSetUp() throws Exception {
		p=new Program("testapp",0,ProgramVariant.orig,null);
	}
	
	@Test
	public void testGetJavaSourceFileName() {
		assertEquals("testclass",new ClassEntity(p,"apache.bcel","testclass.class",null).getJavaSourceFileName());
		assertEquals("testclass",new ClassEntity(p,"apache.bcel","testclass",null).getJavaSourceFileName());
		assertEquals("testclass",new ClassEntity(p,"apache.bcel","testclass$1.class",null).getJavaSourceFileName());
		assertEquals("testclass",new ClassEntity(p,"apache.bcel","testclass$innerclasswithFancynames",null).getJavaSourceFileName());
		assertEquals("testclass",new ClassEntity(p,"","testclass.class",null).getJavaSourceFileName());
		assertEquals("testclass",new ClassEntity(p,"","testclass$1",null).getJavaSourceFileName());
	}

}
