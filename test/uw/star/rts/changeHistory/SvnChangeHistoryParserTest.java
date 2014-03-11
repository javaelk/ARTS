package uw.star.rts.changeHistory;

import static org.junit.Assert.*;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.artifact.EntityType;

public class SvnChangeHistoryParserTest {

	static SvnChangeHistoryParser parser;
	
	@BeforeClass
	public static void setupOnce(){
		Path testfile = Paths.get("test"+File.separator+"testfiles"+java.io.File.separator+"svnChangeHistoryTest.txt");
		parser = new SvnChangeHistoryParser(testfile);
	}
	
	@Test
	public void testParse() {
		assertTrue(parser.allCommits.size()==2);//total of 2 commits
		assertTrue(parser.allCommits.get(0).shaCode.equals("r1570985"));
		assertTrue(parser.allCommits.get(1).shaCode.equals("r1570955"));
		assertTrue(parser.allCommits.get(0).getModifiedFilesMap().get("M").size()==4);
		assertTrue(parser.allCommits.get(0).getModifiedFilesMap().get("M").contains("/lucene/dev/trunk/solr/licenses/slf4j-log4j12-1.7.6.jar.sha1"));
		assertTrue(parser.allCommits.get(0).getModifiedFilesMap().get("D").contains("/lucene/dev/trunk/solr/licenses/jcl-over-slf4j-1.6.6.jar.sha1"));
		assertTrue(parser.allCommits.get(1).getModifiedFilesMap().get("M").size()==16);
		assertTrue(parser.allCommits.get(1).getModifiedFilesMap().get("M").contains("/lucene/dev/trunk/solr/contrib/morphlines-core/src/test-files/test-morphlines/tutorialReadAvroContainer.conf"));
	}

	@Test
	public void testAverageAmountOfCodeChanges() {
		assertEquals(0.0,parser.averageAmountOfCodeChanges(EntityType.SOURCE, "r1570955"),0.001);
		assertEquals(16.0,parser.averageAmountOfCodeChanges(EntityType.SOURCE, "r1570985"),0.001);
		assertEquals(12.0,parser.averageAmountOfCodeChanges(EntityType.SOURCE, "r1570999"),0.001);
	}

	@Test
	public void testGetChangeFrequency() {
		assertTrue(parser.getChangeFrequency(EntityType.SOURCE, "r1570955").count("jacoco/pom.xml")==0);
		assertEquals(1,parser.getChangeFrequency(EntityType.SOURCE, "r1570985").count("/lucene/dev/trunk/solr/contrib/morphlines-core/src/test-files/test-documents/testSVG.svg"));
		assertEquals(2,parser.getChangeFrequency(EntityType.SOURCE, "r1570999").count("/lucene/dev/trunk/solr/contrib/morphlines-core/src/test-files/test-documents/testSVG.svg"));
	}

}
