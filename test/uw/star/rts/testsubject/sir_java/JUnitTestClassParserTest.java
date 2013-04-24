package uw.star.rts.testsubject.sir_java;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.testsubject.sir_java.JUnitTestClassParser;

public class JUnitTestClassParserTest extends AbstractParserTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		parser = new JUnitTestClassParser();
	}


}
