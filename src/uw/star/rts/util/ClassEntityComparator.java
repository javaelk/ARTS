package uw.star.rts.util;

import java.util.Comparator;
import uw.star.rts.artifact.*;

public class ClassEntityComparator implements Comparator<ClassEntity> {

	@Override
	public int compare(ClassEntity o1, ClassEntity o2) {
		if(o1.getPackageName().equals(o2.getPackageName())&&o1.getClassName().equals(o2.getClassName()))
			return 0;
		return -1;
	}

}
