package uw.star.rts.util;

import java.util.Comparator;

import uw.star.rts.artifact.Entity;
import uw.star.rts.artifact.EntityType;

public class EntityComparatorFactory {
	public static Comparator<? extends Entity> createComparator(EntityType type){
		switch(type){
		case STATEMENT:
			return new StatementEntityComparator();
		case SOURCE:
			return new SourceFileEntityComparator();
		case CLAZZ:
			return new ClassEntityComparator();
		default:
			throw new IllegalArgumentException("comparator for "+ type + " is not yet implemented");
			
		}
	}

}
