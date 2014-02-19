package uw.star.rts.util;

import java.util.Comparator;
import uw.star.rts.artifact.*;

public class ClassEntityComparator implements Comparator<ClassEntity> {

	@Override
	public int compare(ClassEntity o1, ClassEntity o2) {
	    return  o1.getName().compareTo(o2.getName());
	}

}
