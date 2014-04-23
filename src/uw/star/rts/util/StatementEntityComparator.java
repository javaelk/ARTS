package uw.star.rts.util;

import java.util.Comparator;

import uw.star.rts.artifact.StatementEntity;
/**
 * this is used to compare statements between different versions, if regular object comparison is used to compare two same statements from
 * different versions, it would return false as they belong to different programs.
 * However, comparing statement from one version to another version is not a trivial task. Current implementation only does line by line 
 * String comparison. It is flawed as it doesn't consider the context, i.e. a statement i=0; in p0 may not be the same as another statement
 * i=0; in p1 if they are not in the same location(method). 
 * TODO: A better approach is to utilize Unix diff result to create a mapping of line numbers between p0 and p1. 
 * this only impacts the counts for Statement coverage stability which does not matter a lot. 
 * @author wliu
 *
 */
public class StatementEntityComparator implements Comparator<StatementEntity> {

	//TODO: this needs to be improved. it's possible that same source file have two identical statements. This should use diff results.
	@Override
	public int compare(StatementEntity o1, StatementEntity o2) {
		if(o1.getPackageName().equals(o2.getPackageName())&&o1.getSrcName().equals(o2.getSrcName())&&
				o1.getStatement().equals(o2.getStatement()))
		return 0;
		return -1;
	}

}
