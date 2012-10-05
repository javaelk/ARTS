package uw.star.rts.artifact;

import uw.star.rts.artifact.CodeKind;
import junit.framework.TestCase;

/**
 * The class <code>CodeKindTest</code> contains tests for the class {@link
 * <code>CodeKind</code>}
 *
 * @pattern JUnit Test Case
 *
 * @generatedBy CodePro at 1/25/12 11:10 AM
 *
 * @author wliu
 *
 * @version $Revision$
 */
public class CodeKindTest extends TestCase {

	/**
	 * Construct new test instance
	 *
	 * @param name the test name
	 */
	public CodeKindTest(String name) {
		super(name);
	}

	/**
	 * Run the String getFilePattern() method test
	 */
	public void testGetFilePattern() {
		assertEquals("*.java",CodeKind.SOURCE.getFilePattern());
	}
}

/*$CPS$ This comment was generated by CodePro. Do not edit it.
 * patternId = com.instantiations.assist.eclipse.pattern.testCasePattern
 * strategyId = com.instantiations.assist.eclipse.pattern.testCasePattern.junitTestCase
 * additionalTestNames = 
 * assertTrue = false
 * callTestMethod = true
 * createMain = false
 * createSetUp = false
 * createTearDown = false
 * createTestFixture = false
 * createTestStubs = false
 * methods = getFilePattern()
 * package = uw.star.sts.artifact
 * package.sourceFolder = STS/src
 * superclassType = junit.framework.TestCase
 * testCase = CodeKindTest
 * testClassType = uw.star.sts.artifact.CodeKind
 */