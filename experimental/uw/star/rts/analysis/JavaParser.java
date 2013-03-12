package uw.star.rts.analysis;

import java.util.List;

import uw.star.rts.artifact.Entity;
import uw.star.rts.artifact.EntityType;

/**
 * A Java parser is capable of parsing Java source code and extract all necessary entities statically
 * This should be a generic interface for ARTS framework to encapsulate underlying implementation choices (whether it's ANTLR,Google Java parser, QDOX..) 
 * @author WEINING LIU
 *
 */
public interface JavaParser {
	//public List<? extends Entity> extractEntities(EntityType type);
	
}
