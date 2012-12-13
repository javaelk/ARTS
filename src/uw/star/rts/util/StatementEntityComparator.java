package uw.star.rts.util;

import java.util.Comparator;

import uw.star.rts.artifact.StatementEntity;

public class StatementEntityComparator implements Comparator<StatementEntity> {

	@Override
	public int compare(StatementEntity o1, StatementEntity o2) {
		if(o1.getPackageName().equals(o2.getPackageName())&&o1.getSrcName().equals(o2.getSrcName())&&
				o1.getStatement().equals(o2.getStatement()))
		return 0;
		return -1;
	}

}
