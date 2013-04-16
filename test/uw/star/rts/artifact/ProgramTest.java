package uw.star.rts.artifact;

import static org.junit.Assert.*;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.analysis.CodeCoverageAnalyzer;
import uw.star.rts.analysis.CodeCoverageAnalyzerFactory;
import uw.star.rts.analysis.EmmaCodeCoverageAnalyzer;
import uw.star.rts.analysis.JacocoCodeCoverageAnalyzer;
import uw.star.rts.extraction.ArtifactFactory;
import uw.star.rts.extraction.SIRJavaFactory;


public class ProgramTest {
	
	static Program p;
	
	@BeforeClass
	public static void oneTimeSetUp() throws Exception {
		ArtifactFactory af =new SIRJavaFactory();
		af.setExperimentRoot("/home/wliu/sir");
		Application app = af.extract("apache-ant",TraceType.CODECOVERAGE_EMMA);
		p=app.getProgram(ProgramVariant.orig, 0);
		CodeCoverageAnalyzer analyzer =  CodeCoverageAnalyzerFactory.create(af,app,p,app.getTestSuite());
		analyzer.extractEntities(EntityType.CLAZZ);
	}

	@Test
	public void testGetCodeFilebyName() {
		//test public class
		Path commandline = Paths.get("/home/wliu/sir/apache-ant/versions.alt/orig/v0/ant/build/classes/org/apache/tools/ant/types/Commandline.class");
		Path codeFile =p.getCodeFilebyName(CodeKind.BINARY, "org.apache.tools.ant.types", "Commandline");
		assertEquals("test public class",0,commandline.compareTo(codeFile));
			
		//test inner class
		Path introspectionHelperInner = Paths.get("/home/wliu/sir/apache-ant/versions.alt/orig/v0/ant/build/classes/org/apache/tools/ant/IntrospectionHelper$10.class");
		codeFile = p.getCodeFilebyName(CodeKind.BINARY, "org.apache.tools.ant", "IntrospectionHelper$10");
		assertEquals("test inner class",0,introspectionHelperInner.compareTo(codeFile));
		
		//test java
		Path aJavaFile = Paths.get("/home/wliu/sir/apache-ant/versions.alt/orig/v0/ant/build/src/main/org/apache/tools/ant/types/Commandline.java");
		codeFile = p.getCodeFilebyName(CodeKind.SOURCE, "org.apache.tools.ant.types", "Commandline.java");
		System.out.println("Comparing " + aJavaFile.toString() +" \n to " + codeFile.toString());
		assertEquals("test java source file",0,aJavaFile.compareTo(codeFile));
		
		//test html
		
		//test property file

	}

	@Test
	public void testGetEntityByName() {

		Entity e = p.getEntityByName(EntityType.SOURCE, "org.apache.tools.ant.types.Commandline.java");
		Path aJavaFile = Paths.get("/home/wliu/sir/apache-ant/versions.alt/orig/v0/ant/build/src/main/org/apache/tools/ant/types/Commandline.java");
		assertEquals("test get source entity",0,aJavaFile.compareTo(e.getArtifactFile()));

		Entity c = p.getEntityByName(EntityType.CLAZZ, "org.apache.tools.ant.IntrospectionHelper$10");
		Path jcemapperInner = Paths.get("/home/wliu/sir/apache-ant/versions.alt/orig/v0/ant/build/classes/org/apache/tools/ant/IntrospectionHelper$10.class");
		assertEquals("test get source entity",0,jcemapperInner.compareTo(c.getArtifactFile()));

	}
	
	@Test
	public void testGetArtifactFile(){
		//test every entity has a Path associated
		boolean result = true;
		for(Entity e: p.getCodeEntities(EntityType.CLAZZ)){
			if(e.getArtifactFile()==null) result = false;
			System.out.println("File for Entity " + e.toString() + " is " + e.getArtifactFile());
		}
		assertTrue("test every class entity has a Path associated",result);
	}


}
