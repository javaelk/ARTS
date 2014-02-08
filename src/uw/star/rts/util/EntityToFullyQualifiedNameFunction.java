package uw.star.rts.util;

import uw.star.rts.artifact.ClassEntity;
import uw.star.rts.artifact.Entity;
import uw.star.rts.artifact.SourceFileEntity;
import uw.star.rts.artifact.StatementEntity;

import com.google.common.base.Function;

public class EntityToFullyQualifiedNameFunction implements Function<Entity, String> {

	@Override
	public String apply(Entity from){
		switch(from.getEntityType()){
		case STATEMENT:
		   StatementEntity stm = (StatementEntity)from;
		   return (stm.getPackageName()==null||stm.getPackageName()=="")?
				   stm.getApplicationName()+"."+stm.getSrcName()+"."+stm.getStatement():
				   stm.getApplicationName()+"."+stm.getPackageName()+"."+stm.getSrcName()+"."+stm.getStatement();
		case SOURCE:
			SourceFileEntity src = (SourceFileEntity)from;
			return (src.getPackageName()==null||src.getPackageName()=="")?
					src.getApplicationName()+"."+src.getSourceFileName():
					src.getApplicationName()+"."+src.getPackageName()+"."+src.getSourceFileName();
		case CLAZZ:
			ClassEntity clz = (ClassEntity)from;
			return (clz.getPackageName()==null||clz.getPackageName()=="")?
					clz.getApplicationName()+"."+clz.getClassName():
					clz.getApplicationName()+"."+clz.getPackageName()+"."+clz.getClassName();
		default:
			throw new IllegalArgumentException("entity type is not yet implemeneted");
					
		}
	}

}
