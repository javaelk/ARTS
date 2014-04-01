package uw.star.rts.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.thoughtworks.qdox.*;
import com.thoughtworks.qdox.model.*;


public class QDoxJavaParser implements JUnit4TestsParser{
	static Logger log = LoggerFactory.getLogger(QDoxJavaParser.class.getName());
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
    
	/**
	 * parse java file and get package name 
	 * throws exception if this is not a Java file (doesn't end with .java), and return null
	 * return empty string "" if this does not have package declaration
	 * @param fileName - absolute path to the java file
	 * @return package name of the given java file
	 */ 
    public static String getJavaPackageName(String fileName) throws JavaParsingException,FileNotFoundException{
		Path javafile = getPathfromFileName(fileName);
		//parsing with QDox
		JavaProjectBuilder builder = new JavaProjectBuilder();
		try {
			builder.addSource(javafile.toFile());
			Collection<JavaSource> srcs = builder.getSources();
			//throws JavaParsing exception if there is more than one source in this file
			if(srcs.size()>1){
				log.error("QDox found more than one JavaSource from file " + fileName);
				throw new JavaParsingException();
			}
			for(JavaSource src: srcs)
				return src.getPackageName();
		} catch (IOException e) {
			log.error("Error reading file " + fileName + " when try to parse it");
			e.printStackTrace();
		}
		return null; //any error happens return null
    }
    
    public static boolean isInterface(String fileName) throws JavaParsingException,FileNotFoundException{
    	Path javafile = getPathfromFileName(fileName);
		JavaProjectBuilder builder = new JavaProjectBuilder();
		try {
			builder.addSource(javafile.toFile());
			Collection<JavaSource> srcs = builder.getSources();
			//throws JavaParsing exception if there is more than one source in this file
			if(srcs.size()>1){
				log.error("QDox found more than one JavaSource from file " + fileName);
				throw new JavaParsingException();
			}
			for(JavaSource src: srcs)
				for(JavaClass cls: src.getClasses())
					return cls.isInterface();
		} catch (IOException e) {
			log.error("Error reading file " + fileName + " when try to parse it");
			e.printStackTrace();
		}
		return false;
    }
    
    private static Path getPathfromFileName(String fileName) throws JavaParsingException,FileNotFoundException{
		Path javafile = Paths.get(fileName);
		//read file 
		if(!Files.exists(javafile)){
			log.error(fileName + " does not exist" );
			throw new FileNotFoundException();
		}
		if(Files.isDirectory(javafile)){
			log.error(fileName + " is a directory" );
			throw new JavaParsingException();
		}
		if(!(javafile.getFileName().toString().endsWith(".java"))){
			log.error(fileName + " is not a Java file" );
			throw new JavaParsingException();
		}
		return javafile;
    }
}
