package uw.star.rts.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.runners.model.FrameworkMethod;
import org.junit.runners.model.TestClass;
import org.slf4j.*;

import uw.star.rts.extraction.SIRJavaFactory;

public class JavaFileParser {

	static Logger log = LoggerFactory.getLogger(JavaFileParser.class.getName());


	/**
	 * parse Java source file to find a matcher
	 * this method return as soon as it finds the 1st match
	 * 
	 */
	public static String getMatcher(String fileName,Pattern pattern1){

		verifyFileExistandNotADirecotry(fileName);

		Path javafile = Paths.get(fileName);
		return getMatcher(javafile,pattern1);
	}

	public static String getMatcher(Path javafile,Pattern pattern1){
		Charset cs = Charset.forName("latin1");
		try(BufferedReader reader = Files.newBufferedReader(javafile, cs)){
			String line =null;
			while((line = reader.readLine())!=null){
				Matcher m1 = pattern1.matcher(line);
				if(m1.find())
					return m1.group(1).trim();
			}
			log.error("pattern " + pattern1.toString() + "not found in file " + javafile);
		}catch(IOException e){
			log.error("IO exception in reading file " + javafile);
			e.printStackTrace();
		}
		return null;
	}

	public static void verifyFileExistandNotADirecotry(String fileName){
		Path javafile = Paths.get(fileName);
		//read file 
		if(!Files.exists(javafile)){
			log.error(fileName + " does not exist" );
			throw new IllegalArgumentException();
		}
		if(Files.isDirectory(javafile)){
			log.error(fileName + " is a directory" );
			throw new IllegalArgumentException();
		}
	}

	public static boolean isInterface(String fileName){
		Pattern interfaceLine = Pattern.compile("^public interface(.*)");
		return getMatcher(fileName,interfaceLine)!=null;
	}

	/**
	 * parse java file and get package name 
	 * @param fileName - absolute path to the java file
	 * @return package name of the given java file
	 */
	public static String getJavaPackageName(String fileName){
		Path javafile = Paths.get(fileName);
		//read file 
		if(!Files.exists(javafile)){
			log.error(fileName + " does not exist" );
			throw new IllegalArgumentException();
		}
		if(Files.isDirectory(javafile)){
			log.error(fileName + " is a directory" );
			throw new IllegalArgumentException();
		}
		return getJavaPackageName(javafile);
	}

	public static String getJavaPackageName(Path javafile){
		Charset cs = Charset.forName("latin1");
		try(BufferedReader reader = Files.newBufferedReader(javafile, cs)){
			String line =null;
			Pattern pattern1 = Pattern.compile("^package(.*);.*");
			Pattern pattern2 = Pattern.compile("^*/package(.*);.*");
			while((line = reader.readLine())!=null){
				Matcher m1 = pattern1.matcher(line);
				if(m1.find())
					return m1.group(1).trim();
				Matcher m2 = pattern2.matcher(line);
				if(m2.find())
					return m2.group(1).trim();

			}
			log.error("package name not found in file " + javafile);
		}catch(IOException e){
			log.error("IO exception in reading file " + javafile);
			e.printStackTrace();
		}
		return null;
	}

}
