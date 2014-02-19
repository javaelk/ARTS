package uw.star.rts.util;

import static org.junit.Assert.*;

import java.nio.file.Path;

import org.junit.Test;

import uw.star.rts.artifact.Application;
import uw.star.rts.artifact.ClassEntity;
import uw.star.rts.artifact.Program;
import uw.star.rts.artifact.ProgramVariant;
import uw.star.rts.artifact.TraceType;
import uw.star.rts.extraction.SIRJavaFactory;

public class ClassEntityComparatorTest {

	@Test
	public void test() {
		//test class name with $ would also match
		Program p0 = new Program("testapp",0,ProgramVariant.orig,null);
		Program p1 = new Program("testapp",1,ProgramVariant.orig,null);
		ClassEntity c1 = new ClassEntity(p0,"org.apache","ICoverageNode$ElementType",null);
		ClassEntity c2 = new ClassEntity(p1,"org.apache","ICoverageNode$ElementType",null);
		assertTrue(new ClassEntityComparator().compare(c1, c2)==0);
	}

}
