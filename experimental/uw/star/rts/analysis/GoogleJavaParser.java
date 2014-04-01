package uw.star.rts.analysis;

import java.util.*;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.ImmutableList;

import uw.star.rts.artifact.*;
import uw.star.rts.extraction.ArtifactFactory;
import japa.parser.ParseException;
import japa.parser.ast.*;
import japa.parser.ast.body.ClassOrInterfaceDeclaration;
import japa.parser.ast.body.MethodDeclaration;
import japa.parser.ast.visitor.VoidVisitorAdapter;

/**
 * This parser uses http://code.google.com/p/javaparser/ and JavaCC 
 * @see http://code.google.com/p/javaparser/
 * @see http://javacc.java.net/
 * TODO: implement me ! not done yet
 * @author wliu
 *
 */
public class GoogleJavaParser implements JavaParser {      

	Program p;
	ArtifactFactory af;
	Logger log;
	
	/**
	 * Constructor, need to know which program(of a specific version) and the ArtifactFactory which has access to the underlying files
	 */
	public GoogleJavaParser(ArtifactFactory af,Program p){
		this.af=af;
		this.p=p;
		log = LoggerFactory.getLogger(GoogleJavaParser.class.getName());
	}
	

	public List<? extends Entity> extractEntities(EntityType type) {
		List<MethodEntity> resultLst = new ArrayList<>();
		if(type.equals(EntityType.METHOD)){
			for(Path javafile : p.getCodeFiles(CodeKind.SOURCE))
				if(javafile.getFileName().toString().endsWith("java")){
                      //resultLst.add(extractMethodName(javafile));					
				}
		}		
		return resultLst;
	}

	public String extractMethodName(Path javafile){
	    StringBuffer mn = new StringBuffer();
		try(InputStream in=Files.newInputStream(javafile, StandardOpenOption.READ)){						
			CompilationUnit cu=japa.parser.JavaParser.parse(in, "UTF-8");
			MethodVisitor mv = new MethodVisitor();
			mv.visit(cu, null);
			mn.append(mv.getMethods());
//			resultLst.addAll(mv.getMethods());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mn.toString();
	}
	
	/**
	 * parse all method signatures
	 * @author wliu
	 *
	 */
	private static class MethodVisitor extends VoidVisitorAdapter{
		List<String> methods;
		
		public MethodVisitor(){
			super();
			methods = new ArrayList<>();
		}
		
		@Override 
		public void visit(MethodDeclaration n,Object arg){
            String m = n.getName();
            
			methods.add(n.getName());
		}
		@Override
		public void visit(ClassOrInterfaceDeclaration n, Object arg){
			
		}
		
		public List<String> getMethods(){
			return methods;
		}
		
	}
}
