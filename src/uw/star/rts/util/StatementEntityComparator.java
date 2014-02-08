package uw.star.rts.util;

import java.util.Comparator;

import uw.star.rts.artifact.StatementEntity;
/**
 * this is used to compare statements between different versions, if regular object comparison is used to compare two same statements from
 * different versions, it would return false as they belong to different programs.
 * @author wliu
 *
 */
public class StatementEntityComparator implements Comparator<StatementEntity> {

	@Override
	public int compare(StatementEntity o1, StatementEntity o2) {
		if(o1.getPackageName().equals(o2.getPackageName())&&o1.getSrcName().equals(o2.getSrcName())&&
				o1.getStatement().equals(o2.getStatement()))
		return 0;
		return -1;
	}

}
