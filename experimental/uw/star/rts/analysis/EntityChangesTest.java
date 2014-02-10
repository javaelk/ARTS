package uw.star.rts.analysis;

import static org.junit.Assert.*;

import com.google.common.base.Function;
import com.google.common.collect.Iterables;
import com.google.common.collect.Sets;

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
		
		assertTrue("Total #of statements for source HtmlFormatter.java in p0: ", ((SourceFileEntity)p0.getEntityByName(EntityType.SOURCE, "org.apache.solr.highlight.HtmlFormatter.java")).getExecutableStatements().size()==9);

		Map<String,List<ClassEntity>> resultMap = MD5ClassChangeAnalyzer.diff(p0, p1);

		System.out.println("NEW classes in p1 , total " + resultMap.get("NEW").size() + " : " + resultMap.get("NEW")+"\n");
		//changed classes
		System.out.println("MODIFIED classes in p0 , total " + resultMap.get("MODIFIED").size() + " : " + resultMap.get("MODIFIED")+"\n");
		System.out.println("DELETED classes in p0 , total " + resultMap.get("DELETED").size() + " : " + resultMap.get("DELETED")+"\n");

		//covered classes in p0
		Set<ClassEntity> changedEntities = Sets.newHashSet(resultMap.get("MODIFIED"));
		changedEntities.addAll(resultMap.get("DELETED"));
		Set<ClassEntity> changedCoveredClassEntities = Sets.intersection(cca1.coveredClassEntities,changedEntities);
		System.out.println("changedCoveredClassEntities in p0 (deleted and modified)intersec covered , total " + changedCoveredClassEntities.size() + " : " + changedCoveredClassEntities+"\n");

		//convert modified class entity into a String set with the same format as changed source 
		Iterable<String> modifiedClsStrSet = Iterables.transform(changedCoveredClassEntities, new Function<ClassEntity,String>(){
			public String apply(ClassEntity cls){
				return (cls.getPackageName().equals(""))?cls.getBestGuessJavaSourceFileName()+".java":
					cls.getPackageName()+"."+cls.getBestGuessJavaSourceFileName()+".java";
			}
		});

		//source
		System.out.println("Total #of source in p0: " + p0.getCodeEntities(EntityType.SOURCE).size());
		System.out.println("Total #of source in p1: " + p1.getCodeEntities(EntityType.SOURCE).size());

		uw.star.rts.analysis.ChangeAnalyzer ca = new TextualDifferencingChangeAnalysis(af,p0,p1); 
		ca.analyzeChange(); 
		//changed source - this includes changed and deleted but not added 
		List<SourceFileEntity> modifiedSrc = ca.getModifiedSourceFiles();
		System.out.println("MODIFIED source files in p0 , total " + modifiedSrc.size() + " : " + modifiedSrc+"\n");
		//covered source
		Set<SourceFileEntity> changedCoveredSrcEntities = Sets.intersection(cca1.coveredSrcEntities, Sets.newHashSet(modifiedSrc));
		System.out.println("changedCoveredSrcEntities in p0 (new, deleted & modified)intersec covered , total " + changedCoveredSrcEntities.size() + " : " + changedCoveredSrcEntities+"\n");
		//convert modified source entity to a set of Strings
		Set<String> modifiedSrcStrSet = Sets.newHashSet(Iterables.transform(changedCoveredSrcEntities,new Function<SourceFileEntity,String>(){
			public String apply(SourceFileEntity src){
				return src.toString();
			}
		}));

		//verify every changed classes' source are in the changed source list
		for(String cls: modifiedClsStrSet)
			if(!modifiedSrcStrSet.contains(cls))
				System.out.println("modified class " + cls+ " is not in modified source list\n"); 
	}



}
