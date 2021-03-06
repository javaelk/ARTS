package uw.star.rts.util;

import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


import com.thoughtworks.qdox.*;
import com.thoughtworks.qdox.model.*;


public class QDoxJavaParser implements JUnit4TestsParser{

	String JUNIT4_TEST_ANNOTATION_REGEX="@Test.*|@org.junit.Test.*";
	@Override
	public List<String> getJUnit4TestMethodsFromFolder(Path testFileFolder){
		List<String> resultLst = new ArrayList<>();
		JavaProjectBuilder builder = new JavaProjectBuilder();
		builder.addSourceTree(testFileFolder.toFile());
		/*		//optionally add ClassLibrary here
		ClassLibrary lib = builder.getClassLibrary();
		lib.addSourceFolder(mainfile.toFile());*/
		for(JavaSource src: builder.getSources())
			for(JavaClass cls :src.getClasses()){
			    if(cls.isAbstract()) continue;   //BUG fix, skip abstract
				for(JavaMethod m : cls.getMethods(true))  //add test methods from super
					for ( JavaAnnotation note: m.getAnnotations())
						if(note.toString().matches(JUNIT4_TEST_ANNOTATION_REGEX))	
							resultLst.add(cls.getFullyQualifiedName()+"."+m.getName());
			}
		return resultLst;
	}
	@Override
	public List<String> getJUnit4TestMethodsFromFile(Path testFile){
		List<String> resultLst = new ArrayList<>();
		JavaProjectBuilder builder = new JavaProjectBuilder();
		try {
			builder.addSource(testFile.toFile());
			/*		//optionally add ClassLibrary here
			ClassLibrary lib = builder.getClassLibrary();
			lib.addSourceFolder(mainfile.toFile());*/
			for(JavaSource src: builder.getSources())
				for(JavaClass cls :src.getClasses()){
					if(cls.isAbstract()) continue;   //BUG fix, skip abstract
					for(JavaMethod m : cls.getMethods(true))  //add test methods from super
						for ( JavaAnnotation note: m.getAnnotations())
							if(note.toString().matches(JUNIT4_TEST_ANNOTATION_REGEX))	
								resultLst.add(cls.getFullyQualifiedName()+"."+m.getName());
				}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultLst;
	}

	@Override
    public List<String> getJUnit4TestClassesFromFolder(Path testFileFolder){
		Set <String> resultSet = new HashSet<>();
		JavaProjectBuilder builder = new JavaProjectBuilder();
		builder.addSourceTree(testFileFolder.toFile());
		for(JavaSource src: builder.getSources())
			for(JavaClass cls :src.getClasses()){
			    if(cls.isAbstract()) continue;   //BUG fix, skip abstract
				for(JavaMethod m : cls.getMethods(true))  //add test methods from super
					for ( JavaAnnotation note: m.getAnnotations())
						if(note.toString().matches(JUNIT4_TEST_ANNOTATION_REGEX))	
							resultSet.add(cls.getFullyQualifiedName());
			}
		return new ArrayList<String>(resultSet);
    }
    //parse one file only
	@Override
    public List<String> getJUnit4TestClassesFromFile(Path testFile){
		Set <String> resultSet = new HashSet<>();
		JavaProjectBuilder builder = new JavaProjectBuilder();
		try {
			builder.addSource(testFile.toFile());
			for(JavaSource src: builder.getSources())
				for(JavaClass cls :src.getClasses()){
					if(cls.isAbstract()) continue;   //BUG fix, skip abstract
					for(JavaMethod m : cls.getMethods(true))  //add test methods from super
						for ( JavaAnnotation note: m.getAnnotations())
							if(note.toString().matches(JUNIT4_TEST_ANNOTATION_REGEX))	
								resultSet.add(cls.getFullyQualifiedName());
				}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ArrayList<String>(resultSet);
	}
	/**
	 * this is not smart enough to find all inner classes and static classes
	 * use with caution! 
	 * @param testFile
	 * @return
	 */
    public List<String> getClassesFromSource(Path testFile){
		Set <String> resultSet = new HashSet<>();
		JavaProjectBuilder builder = new JavaProjectBuilder();
		try {
			builder.addSource(testFile.toFile());
			for(JavaSource src: builder.getSources())
				for(JavaClass cls :src.getClasses())
					resultSet.add(cls.getFullyQualifiedName());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (com.thoughtworks.qdox.parser.ParseException e){
			e.printStackTrace(); //print stacktrace but continue - return empty set of Classes
		}
		
		return new ArrayList<String>(resultSet);
	}
}
