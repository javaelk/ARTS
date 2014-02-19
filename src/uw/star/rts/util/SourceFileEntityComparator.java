package uw.star.rts.util;

import java.util.Comparator;
import uw.star.rts.artifact.*;

public class SourceFileEntityComparator implements Comparator<SourceFileEntity> {

	@Override
	public int compare(SourceFileEntity o1, SourceFileEntity o2) {
		return o1.getName().compareTo(o2.getName());
	}
}
