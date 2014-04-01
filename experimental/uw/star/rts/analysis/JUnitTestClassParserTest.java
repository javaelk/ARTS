package uw.star.rts.analysis;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.util.AbstractParserTest;

public class JUnitTestClassParserTest extends AbstractParserTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		parser = new JUnitTestClassParser();
	}


}
