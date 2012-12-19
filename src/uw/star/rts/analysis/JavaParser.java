package uw.star.rts.analysis;

import java.util.List;

import uw.star.rts.artifact.Entity;
import uw.star.rts.artifact.EntityType;

/**
 * A Java parser is capable of parsing Java source code and extract all necessary entities
 * @author WEINING LIU
 *
 */
public interface JavaParser {
	public List<? extends Entity> extractEntities(EntityType type);
}
