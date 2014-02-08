package uw.star.rts.util;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.google.common.collect.Iterables;
import com.google.common.collect.Lists;

import uw.star.rts.artifact.ClassEntity;
import uw.star.rts.artifact.Entity;
import uw.star.rts.artifact.Program;
import uw.star.rts.artifact.ProgramVariant;
import uw.star.rts.artifact.SourceFileEntity;
import uw.star.rts.artifact.StatementEntity;

public class EntityToFullyQualifiedNameFunctionTest {

	@Test
	public void testApply() {
		Program p = new Program("p1",0,ProgramVariant.orig,null);
		List<Entity> stms = new ArrayList<>();
		stms.add(new StatementEntity(p,"org","test1",10,"10 c=1",null));
		stms.add(new StatementEntity(p,null,"test2",10,"10 c=1",null));
		stms.add(new StatementEntity(p,"","test3",10,"10 c=1",null));
		List<String> stmsStr = Lists.newArrayList(Iterables.transform(stms, new EntityToFullyQualifiedNameFunction()));
		assertEquals(stmsStr.get(0),"p1.org.test1.10 c=1");
		assertEquals(stmsStr.get(1),"p1.test2.10 c=1");
		assertEquals(stmsStr.get(2),"p1.test3.10 c=1");
		
		List<Entity> src = new ArrayList<>();
		src.add(new SourceFileEntity(p,"org","test1",null));
		src.add(new SourceFileEntity(p,null,"test2",null));
		src.add(new SourceFileEntity(p,"","test3",null));
		List<String> srcStr = Lists.newArrayList(Iterables.transform(src, new EntityToFullyQualifiedNameFunction()));
		assertEquals(srcStr.get(0),"p1.org.test1");
		assertEquals(srcStr.get(1),"p1.test2");
		assertEquals(srcStr.get(2),"p1.test3");
		
		List<Entity> clz = new ArrayList<>();
		clz.add(new ClassEntity(p,"org","test1",null));
		clz.add(new ClassEntity(p,null,"test2",null));
		clz.add(new ClassEntity(p,"","test3",null));
		List<String> clzStr = Lists.newArrayList(Iterables.transform(clz, new EntityToFullyQualifiedNameFunction()));
		assertEquals(clzStr.get(0),"p1.org.test1");
		assertEquals(clzStr.get(1),"p1.test2");
		assertEquals(clzStr.get(2),"p1.test3");
		
	}

}
