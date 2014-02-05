package uw.star.rts.analysis;

import static org.junit.Assert.*;

import java.io.File;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.artifact.Application;
import uw.star.rts.artifact.ClassEntity;
import uw.star.rts.artifact.EntityType;
import uw.star.rts.artifact.Program;
import uw.star.rts.artifact.ProgramVariant;
import uw.star.rts.artifact.SourceFileEntity;
import uw.star.rts.artifact.TraceType;
import uw.star.rts.extraction.ArtifactFactory;
import uw.star.rts.extraction.SIRJavaFactory;
import uw.star.rts.util.Constant;
import uw.star.rts.util.PropertyUtil;

public class EntityChangesTest {
	static String EXPERIMENT_ROOT;
	static ArtifactFactory af;
	
	@BeforeClass
	public static void OneTimeSetup(){
		af =new SIRJavaFactory();
		EXPERIMENT_ROOT = PropertyUtil.getPropertyByName("config"+File.separator+"ARTSConfiguration.property",Constant.EXPERIMENTROOT);
		af.setExperimentRoot(EXPERIMENT_ROOT);		
	}
	/**
	 * this is compare the class entity changes with source entity changes
	 * for a give version of the program, all changed classes should have source changed, and all source changes should have
	 * at least one of it's class changed
	 * changed == modified
	 */
	@Test
	public void ClassChangeAndSourceChangeTest(){
		Application testapp = af.extract("apache_solr_core_release-TM",TraceType.CODECOVERAGE_JACOCO);
		Program p0 = testapp.getProgram(ProgramVariant.orig, 0);
		Program p1= testapp.getProgram(ProgramVariant.orig, 1);
		
		//class Entity
		CodeCoverageAnalyzer cca1 =  CodeCoverageAnalyzerFactory.create(af,testapp,p0,testapp.getTestSuite());
		cca1.extractEntities(EntityType.SOURCE);
		cca1.extractEntities(EntityType.CLAZZ);
		
		CodeCoverageAnalyzer cca2 =  CodeCoverageAnalyzerFactory.create(af,testapp,p1,testapp.getTestSuite());
		cca2.extractEntities(EntityType.SOURCE);
		cca2.extractEntities(EntityType.CLAZZ);

		System.out.println("Total #of classes in p0: " + p0.getCodeEntities(EntityType.CLAZZ).size());
		System.out.println("Total #of classes in p1: " + p1.getCodeEntities(EntityType.CLAZZ).size());
		
		Map<String,List<ClassEntity>> resultMap = MD5ClassChangeAnalyzer.diff(p0, p1);
		List<ClassEntity> newEntities = resultMap.get("NEW");
		List<ClassEntity> modifiedEntities = resultMap.get("MODIFIED");
		List<ClassEntity> deletedEntities = resultMap.get("DELETED");

		System.out.println("NEW classes in p1 , total " + newEntities.size() + " : " + newEntities+"\n");
		//changed classes
		System.out.println("MODIFIED classes in p1 , total " + modifiedEntities.size() + " : " + modifiedEntities+"\n");
		System.out.println("DELETED classes in p1 , total " + deletedEntities.size() + " : " + deletedEntities+"\n");

		//convert modified classentity into a String set with the same format as changed source 
		Set<String> modifiedClsStrSet = new HashSet<>(); 
		for(ClassEntity cls:modifiedEntities){
			if(cls.getPackageName().equals("")){
			   modifiedClsStrSet.add(cls.getJavaSourceFileName()+".java");
			}else{
				modifiedClsStrSet.add(cls.getPackageName()+"."+cls.getJavaSourceFileName()+".java");
			}
		}

		//source
		System.out.println("Total #of source in p0: " + p0.getCodeEntities(EntityType.SOURCE).size());
		System.out.println("Total #of source in p1: " + p1.getCodeEntities(EntityType.SOURCE).size());
		
		uw.star.rts.analysis.ChangeAnalyzer ca = new TextualDifferencingChangeAnalysis(af,p0,p1); 
		ca.analyzeChange(); 
		//changed source - this includes added, changed and deleted 
		List<SourceFileEntity> modifiedSrc = ca.getModifiedSourceFiles();
		System.out.println("MODIFIED source files in p1 , total " + modifiedSrc.size() + " : " + modifiedSrc+"\n");
		//convert modified source entity to a set of Strings
		Set<String> modifiedSrcStrSet = new HashSet<>();
		for(SourceFileEntity src: modifiedSrc)
			modifiedSrcStrSet.add(src.toString());
		
		//verify every changed classes' source are in the changed source list
        for(String cls: modifiedClsStrSet)
		if(!modifiedSrcStrSet.contains(cls))
			System.out.println("Modified Class " + cls + " is NOT in modified source list");


		//changed covered classes
		
		
	}
}
