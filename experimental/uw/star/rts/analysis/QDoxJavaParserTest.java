package uw.star.rts.analysis;

import static org.junit.Assert.*;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import uw.star.rts.util.JavaFileParser;

public class QDoxJavaParserTest extends AbstractParserTest {
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		parser = new QDoxJavaParser();
	}

}
