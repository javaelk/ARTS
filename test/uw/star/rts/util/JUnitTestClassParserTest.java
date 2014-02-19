package uw.star.rts.util;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.util.JUnitTestClassParser;

public class JUnitTestClassParserTest extends AbstractParserTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		parser = new JUnitTestClassParser();
	}


}
