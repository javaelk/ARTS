package uw.star.rts.analysis;

import uw.star.rts.artifact.*;

import java.util.*;
/**
 * Coverage Analysis is used to identify the relationship between the test suite and the entities
 * in the system under test that are exercised by the test suite
 * A code coverage analyzer should be able to build a Coverage Matrix based on some artifacts created from test execution
 * 
 * @author Weining Liu
 *
 */
public abstract class CodeCoverageAnalyzer {
	
		
	/**
	 * Let Ec denote the set of covered entities
	 * Ec = { e in E | (exist t in T)(t covers e)} 
	 * For every e in E, there must exist a t that executing t on P causes entity e 
	 * to be exercised at least once
	 *  
	 * @return
	 */
	public abstract List<? extends Entity> extractEntities(EntityType type); //TODO: Move to static source code parser. 
	public abstract <E extends Entity> CodeCoverage<E> createCodeCoverage(EntityType type);
	
}
