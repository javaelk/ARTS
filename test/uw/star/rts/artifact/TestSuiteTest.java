package uw.star.rts.artifact;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

public class TestSuiteTest {
     static TestCase tc1,tc2,tc3,tc4;
     static TestSuite ts;
     static List<TestCase>  tcs;
    /**
     * version   0   1   2   3
     * tc1       x   x   x   x
     * tc2           x   x   x
     * tc3       x
     * tc4           x   x  
     * 	
     * @throws Exception
     */
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
		tc1 = new TestCase("xml-security",0,"TEST1",null);
		tc2 = new TestCase("xml-security",1,"TEST2",null);
		tc3 = new TestCase("xml-security",0,"TEST3",null);
		tc4 = new TestCase("xml-security",1,"TEST4",null);
		tc1.addApplicableVersion(0);
		tc1.addApplicableVersion(1);
		tc1.addApplicableVersion(2);
		tc1.addApplicableVersion(3);
		tc2.addApplicableVersion(1);
		tc2.addApplicableVersion(2);
		tc2.addApplicableVersion(3);
		tc3.addApplicableVersion(0);
		tc4.addApplicableVersion(1);
		tc4.addApplicableVersion(2);
		tcs = new ArrayList<>();
		tcs.add(tc1);
		tcs.add(tc2);
		tcs.add(tc3);
		tcs.add(tc4);
		
		ts = new TestSuite("xml-security","xml-security",tcs,null);
		System.out.println(ts);
	}

	@Test
	public void testGetName() {
		assertTrue("xml-security".equals(ts.getName()));
	}

	@Test
	public void testGetTestCases() {
		assertTrue(tcs.equals(ts.getTestCases()));
	}

	@Test
	public void testGetTestCaseByName() {
		assertTrue(tc1.equals(ts.getTestCaseByName("TEST1")));
	}

	@Test
	public void testGetTestCaseByID() {
		assertTrue(tc2.equals(ts.getTestCaseByID(tc2.getTestCaseID())));
	}

	@Test
	public void testGetTestCaseByVersion() {
		assertTrue(ts.getTestCaseByVersion(0).contains(tc1));
		assertTrue(ts.getTestCaseByVersion(0).contains(tc3));
		assertFalse(ts.getTestCaseByVersion(0).contains(tc2));
		assertTrue(ts.getTestCaseByVersion(1).contains(tc1));
		assertTrue(ts.getTestCaseByVersion(1).contains(tc2));
		assertTrue(ts.getTestCaseByVersion(1).contains(tc4));
		assertTrue(ts.getTestCaseByVersion(2).contains(tc1));
		assertTrue(ts.getTestCaseByVersion(2).contains(tc2));
		assertTrue(ts.getTestCaseByVersion(2).contains(tc4));
		assertTrue(ts.getTestCaseByVersion(3).contains(tc1));
		assertTrue(ts.getTestCaseByVersion(3).contains(tc2));
	}

	@Test
	public void testGetRegressionTestCasesByVersion() {
		assertTrue(ts.getRegressionTestCasesByVersion(0).contains(tc1));
		assertFalse(ts.getRegressionTestCasesByVersion(0).contains(tc3));
		assertTrue(ts.getRegressionTestCasesByVersion(1).contains(tc1));
		assertTrue(ts.getRegressionTestCasesByVersion(1).contains(tc2));
		assertTrue(ts.getRegressionTestCasesByVersion(1).contains(tc4));
		assertTrue(ts.getRegressionTestCasesByVersion(2).contains(tc1));
		assertTrue(ts.getRegressionTestCasesByVersion(2).contains(tc2));
		assertFalse(ts.getRegressionTestCasesByVersion(2).contains(tc4));
		assertFalse(ts.getRegressionTestCasesByVersion(3).contains(tc1));
		assertFalse(ts.getRegressionTestCasesByVersion(3).contains(tc2));
		assertTrue(ts.getRegressionTestCasesByVersion(3).size()==0);
	}

	@Test
	public void testSize() {
		assertTrue(ts.size()==4);
	}

	@Test
	public void testSizeInt() {
		assertTrue(ts.size(0)==2);
		assertTrue(ts.size(1)==3);
		assertTrue(ts.size(2)==3);
		assertTrue(ts.size(3)==2);
	}

	@Test
	public void testGetTestSuiteName() {
		assertTrue(ts.getName().equals("xml-security"));
	}

}
