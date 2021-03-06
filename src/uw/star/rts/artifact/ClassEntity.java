package uw.star.rts.artifact;
import java.util.*;
import java.nio.file.*;
/**
 * this class represents compiled java class 
 * @author wliu
 *
 */
public class ClassEntity extends Entity{
	/**
	 * @uml.property  name="packageName"
	 */
	String packageName;
	/**
	 * @uml.property  name="className"
	 */
	String className;
	
	Program p;
	SourceFileEntity source;
	List<MethodEntity> methods;
	
	//class entity represent a class file(complied from source file)
	public ClassEntity(Program p, String packageName, String className,Path classFile){//class name may not be the same as classfile name
		super(p.getApplicationName(),p.getVersionNo(),classFile);
		this.packageName =packageName;
		this.className = className;
		this.p =p;
	}
    
	//alternative constructor with fully qualified class name
	public ClassEntity(Program p, String fullyQualifiedClassName,Path classFile){//class name may not be the same as classfile name
		super(p.getApplicationName(),p.getVersionNo(),classFile);
		this.packageName =fullyQualifiedClassName.substring(0, fullyQualifiedClassName.lastIndexOf("."));
		this.className = fullyQualifiedClassName.substring(fullyQualifiedClassName.lastIndexOf(".")+1);
		this.p =p;
	}
	
	public boolean setSource(SourceFileEntity se){
		source = se;
		return true;
	}
	
	public SourceFileEntity getSource(){
		return source;
		
	}
	public boolean setMethods(List<MethodEntity> methods){
		this.methods = methods;
		return true;
	}
	
	public List<MethodEntity> getMethods(){
		return this.methods;
	}

	
	@Override
	public String toString(){
		return (packageName==null||packageName.equals(""))?
				className:
				packageName+ "."+ className;
	}
	
	public String getName(){
		return this.toString();
	}
	
	public String getPackageName(){
		return packageName;
	}
	
	public String getClassName(){
		return className;
	}

	public Program getProgram(){
		return p;
	}
	
	/*this makes a best guess of Java source file name by removing .class and $ for inner class
	 * package name is not included in the return
	 * and no .java extension
	 * this is only a best guess as there are many cases where it's impossible to figure out the original source name from class name
	 * Java allows multiple classes in one source as long as there is only one public
	 * also Java allows class name with $
	 *
	 */
	public String getBestGuessJavaSourceFileName(){
		StringBuilder clsName = new StringBuilder(this.getClassName());
		int extensionIdx = clsName.lastIndexOf(".class");
		if(extensionIdx!=-1) //contains .class file extension name
			clsName.delete(extensionIdx, clsName.length());
		int innerClassIdx = clsName.indexOf("$"); //this is not bullet proof as Java class name can contain $
		if(innerClassIdx!=-1)
			clsName.delete(innerClassIdx, clsName.length());
		return clsName.toString();

	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((className == null) ? 0 : className.hashCode());
		result = prime * result + ((p == null) ? 0 : p.getName().hashCode());
		result = prime * result
				+ ((packageName == null) ? 0 : packageName.hashCode());
		return result;
	}

	@Override 
    public boolean equals(Object o){
		if(this==o) return true;
		if(o instanceof ClassEntity){//if o is null, this would be false 
			ClassEntity ce = (ClassEntity)o;
			return (this.packageName.equals(ce.getPackageName())&&this.className.equals(ce.getClassName())&&this.p==ce.getProgram());
		}else{
			return false;
		}
	}
	
	public EntityType getEntityType(){
		return EntityType.CLAZZ;
	}
}
