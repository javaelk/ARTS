package uw.star.rts.util;

import java.util.Comparator;
import uw.star.rts.artifact.*;

public class SourceFileEntityComparator implements Comparator<SourceFileEntity> {

	@Override
	public int compare(SourceFileEntity o1, SourceFileEntity o2) {
		if(o1.getPackageName().equals(o2.getPackageName())&&o1.getSourceFileName().equals(o2.getSourceFileName()))
			return 0;
		return -1;
	}

}
