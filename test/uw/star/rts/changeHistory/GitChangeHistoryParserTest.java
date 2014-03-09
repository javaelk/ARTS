package uw.star.rts.changeHistory;

import static org.junit.Assert.*;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.artifact.EntityType;

public class GitChangeHistoryParserTest {

	static GitChangeHistoryParser parser;
	
	@BeforeClass
	public static void setupOnce(){
		Path testfile = Paths.get("test"+File.separator+"testfiles"+java.io.File.separator+"jacoco_core.changehistory.txt");
		parser = new GitChangeHistoryParser(testfile);
	}
	
	@Test
	public void testParse() {
		assertTrue(parser.allCommits.size()==2);//total of 2 commits
		assertTrue(parser.allCommits.get(0).shaCode.equals("f8176c407fc64cf126a6b66047d295d22ddb402d"));
		assertTrue(parser.allCommits.get(1).shaCode.equals("de1febf766dbde623c767c5d1d492f0296474ae9"));
		assertTrue(parser.allCommits.get(0).getModifiedFilesMap().get("M").size()==5);
		assertTrue(parser.allCommits.get(0).getModifiedFilesMap().get("M").contains("jacoco-maven-plugin.test/pom.xml"));
		assertTrue(parser.allCommits.get(0).getModifiedFilesMap().get("A").contains("pom.xml"));
		assertTrue(parser.allCommits.get(1).getModifiedFilesMap().get("M").size()==6);
		assertTrue(parser.allCommits.get(1).getModifiedFilesMap().get("M").contains("org.jacoco.agent/META-INF/MANIFEST.MF"));
		assertTrue(parser.allCommits.get(1).getModifiedFilesMap().get("D").contains("jacoco-maven-plugin.test/pom.xml"));
		
		
	}

	@Test
	public void testAverageAmountOfCodeChanges() {
		assertEquals(0.0,parser.averageAmountOfCodeChanges(EntityType.SOURCE, "de1febf766dbde623c767c5d1d492f0296474ae9"),0.001);
		assertEquals(7.0,parser.averageAmountOfCodeChanges(EntityType.SOURCE, "f8176c407fc64cf126a6b66047d295d22ddb402d"),0.001);
		assertEquals(6.0,parser.averageAmountOfCodeChanges(EntityType.SOURCE, "f8176c407aac64cf126a6b66047d295d22ddb402d"),0.001);
	}

	@Test
	public void testGetChangeFrequency() {
		assertTrue(parser.getChangeFrequency(EntityType.SOURCE, "dsfsfsdfshaCode").count("jacoco/pom.xml")==2);
		assertTrue(parser.getChangeFrequency(EntityType.SOURCE, "f8176c407fc64cf126a6b66047d295d22ddb402d").count("jacoco/pom.xml")==1);
		assertTrue(parser.getChangeFrequency(EntityType.SOURCE, "de1febf766dbde623c767c5d1d492f0296474ae9").count("jacoco/pom.xml")==0);
	}

}
