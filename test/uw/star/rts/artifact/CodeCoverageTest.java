package uw.star.rts.artifact;

import static org.junit.Assert.*;
import uw.star.rts.artifact.*;
import uw.star.rts.extraction.*;
import uw.star.rts.util.StatementEntityComparator;

import java.util.*;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class CodeCoverageTest extends TraceTest{

	
	String EXPERIMENTROOT = "/home/wliu/sir";
	String appname = "apache-xml-security";
	Program p;
	SourceFileEntity sfe;
	StatementEntity s1,s2,s3,s4;

	protected CodeCoverage codeCoverage;
	protected List<TestCase> tca;
	protected List<TestCase> tcb;
	
	/*    s1  s2  s3 s4
	 * a  x       x
	 * b             
	 * c  x       x
	 * d             x    
	 * e          x
	 * f  x
	 */
	@Before
	public void setUp() throws Exception {
		super.setUp();
		SIRJavaFactory sir = new SIRJavaFactory();
		sir.setExperimentRoot(EXPERIMENTROOT);
		Application testapp = sir.extract(appname);
		p = testapp.getProgram(ProgramVariant.orig, 0);
		sfe = new SourceFileEntity(p,"default.package","test.java",null);
		s1 = new StatementEntity(sfe,10,"int i=0");
		s2 = new StatementEntity(sfe,20,"int j=0");
		s3 = new StatementEntity(sfe,120,"int k=0");
		s4 = new StatementEntity(sfe,140,"int h=0");
		
		tca = new ArrayList<>();
		tcb = new ArrayList<>();
		tca.add(a);tca.add(b);tca.add(c);tca.add(d);tca.add(e);tca.add(f);
		tcb.add(a);tcb.add(b);tcb.add(c);
		List<StatementEntity> sea = new ArrayList<>();
		sea.add(s1);sea.add(s2);sea.add(s3); sea.add(s4);
		codeCoverage =new CodeCoverage<StatementEntity>(tca,sea,null);
		codeCoverage.setLink(a, s1);
		codeCoverage.setLink(a, s3);
		codeCoverage.setLink(c, s1);
		codeCoverage.setLink(c, s3);
		codeCoverage.setLink(d,s4);
		codeCoverage.setLink(e, s3);
		codeCoverage.setLink(f,s1);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetCumulativeCoverage() {
		assertEquals("cumlative coverage ",7,codeCoverage.getCumulativeCoverage() );
	}
	@Test
	public void testGetCoveredEntites(){
		List<Entity> covered = codeCoverage.getCoveredEntities();
		assertEquals("# of  entites are covered",3,covered.size());
		assertTrue("s1 is covered",covered.contains(s1));
		assertFalse("s2 is not covered",covered.contains(s2));
		assertTrue("s3 is covered",covered.contains(s3));
		assertTrue("s4 is covered",covered.contains(s4));
	}
	
	@Test
	public void testGetCumulativeCoverageList() {
		assertEquals("cumlative coverage ",4,codeCoverage.getCumulativeCoverage(tcb));
	}

	@Test
	public void testGetCoveredEntitesList(){
		List<Entity> covered = codeCoverage.getCoveredEntities(tcb);
		assertEquals("# of  entites are covered",2,covered.size());
		assertTrue("s1 is covered",covered.contains(s1));
		assertFalse("s2 is not covered",covered.contains(s2));
		assertTrue("s3 is covered",covered.contains(s3));
		assertFalse("s4 is not covered",covered.contains(s4));
	}
	/*    s1  s2  s3 s4
	 * a  x       x
	 * b             
	 * c  x       x
	 * d             x    
	 * e          x
	 * f  x
	 */
	@Test 
	public void testdiff(){
		/*    s1  s2  s3
		 * a  x       x
		 * b          x  
		 * c  x   
		 * d  x             
		 * f  x
		 */
		SIRJavaFactory sir = new SIRJavaFactory();
		Application testapp = sir.extract(appname);
		Program p1 = testapp.getProgram(ProgramVariant.orig, 1);
		SourceFileEntity sfe1 = new SourceFileEntity(p1,"default.package","test.java",null);
		StatementEntity s1 = new StatementEntity(sfe1,10,"int i=0");
		StatementEntity s2 = new StatementEntity(sfe1,20,"int j=0");
		StatementEntity s3 = new StatementEntity(sfe1,120,"int k=0");
		List<TestCase> tcc = new ArrayList<>();
		tcc.add(a);tcc.add(b);tcc.add(c);tcc.add(d);tcc.add(f);
		List<StatementEntity> sea = new ArrayList<>();
		sea.add(s1);sea.add(s2);sea.add(s3);
		CodeCoverage cc =new CodeCoverage<StatementEntity>(tcc,sea,null);
		cc.setLink(a, s1);
		cc.setLink(a, s3);
		cc.setLink(b, s3);
		assertEquals("changed elements",4,codeCoverage.diff(cc,new StatementEntityComparator()));
		cc.setLink(c, s1);
		assertEquals("changed elements",3,codeCoverage.diff(cc,new StatementEntityComparator()));
		cc.setLink(d, s1);
		assertEquals("changed elements",4,codeCoverage.diff(cc,new StatementEntityComparator()));
		cc.setLink(f,s1);
		assertEquals("changed elements",3,codeCoverage.diff(cc,new StatementEntityComparator()));
	}
}
