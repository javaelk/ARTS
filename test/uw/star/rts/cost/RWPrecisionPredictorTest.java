package uw.star.rts.cost;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.artifact.CodeCoverageTest;
import uw.star.rts.artifact.TestCase;

public class RWPrecisionPredictorTest extends CodeCoverageTest {

	@Before
	public void setUp() throws Exception {
		super.setUp();
	}

	@Test
	public void testGetPredicatedPercetageOfTestCaseSelected() {
		
		assertEquals("selection rate",0.388,RWPredictor.predictSelectionRate(codeCoverage,tca),0.01);
		List<TestCase> regressionSuite = new ArrayList<>();
		regressionSuite.add(a);
		regressionSuite.add(b);
		regressionSuite.add(c);
		assertEquals("selection rate",0.67,RWPredictor_RegressionTestsOnly.predictSelectionRate(codeCoverage,regressionSuite),0.01);
		assertEquals("selection rate",1,RWPredictor_multiChanges.predictSelectionRate(codeCoverage.getCoveredEntities(regressionSuite).size(),2),0.01);
	    assertEquals("selection rate",0.66,RWPredictor_multiChanges2.predictSelectionRate(codeCoverage,regressionSuite,2),0.01);
	}
}
