package uw.star.rts.analysis;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import com.thoughtworks.qdox.*;
import com.thoughtworks.qdox.library.ClassLibrary;
import com.thoughtworks.qdox.model.*;


public class QDoxJavaParser implements JUnit4TestsParser{

	String JUNIT4_TEST_ANNOTATION_REGEX="@Test.*|@org.junit.Test.*";
	public List<String> getJUnit4TestMethodsFromFolder(Path testFileFolder){
		List<String> resultLst = new ArrayList<>();
		JavaDocBuilder builder = new JavaDocBuilder();
		builder.addSourceTree(testFileFolder.toFile());
		/*		//optionally add ClassLibrary here
		ClassLibrary lib = builder.getClassLibrary();
		lib.addSourceFolder(mainfile.toFile());*/
		for(JavaSource src: builder.getSources())
			for(JavaClass cls :src.getClasses())
				for(JavaMethod m : cls.getMethods(true))  //add test methods from super
					for ( Annotation note: m.getAnnotations())
						if(note.toString().matches(JUNIT4_TEST_ANNOTATION_REGEX))	
							resultLst.add(cls.getFullyQualifiedName()+"."+m.getName());
		return resultLst;
	}
	
	public List<String> getJUnit4TestMethodsFromFile(Path testFileFolder){
		List<String> resultLst = new ArrayList<>();
		JavaDocBuilder builder = new JavaDocBuilder();
		try {
			builder.addSource(testFileFolder.toFile());
			/*		//optionally add ClassLibrary here
			ClassLibrary lib = builder.getClassLibrary();
			lib.addSourceFolder(mainfile.toFile());*/
			for(JavaSource src: builder.getSources())
				for(JavaClass cls :src.getClasses())
					for(JavaMethod m : cls.getMethods(true))  //add test methods from super
						for ( Annotation note: m.getAnnotations())
							if(note.toString().matches(JUNIT4_TEST_ANNOTATION_REGEX))	
								resultLst.add(cls.getFullyQualifiedName()+"."+m.getName());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultLst;
	}
	
}
