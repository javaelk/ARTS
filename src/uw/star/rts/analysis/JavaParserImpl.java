package uw.star.rts.analysis;

import java.util.*;
import java.io.InputStream;
import java.nio.file.*;

import com.google.common.collect.ImmutableList;

import uw.star.rts.artifact.*;
import uw.star.rts.extraction.ArtifactFactory;
import japa.parser.ast.*;
import japa.parser.ast.body.MethodDeclaration;
import japa.parser.ast.visitor.VoidVisitorAdapter;

/**
 * This parser uses http://code.google.com/p/javaparser/ and JavaCC 
 * @see http://code.google.com/p/javaparser/
 * @see http://javacc.java.net/
 * 
 * @author wliu
 *
 */
public class JavaParserImpl implements JavaParser {

	Program p;
	ArtifactFactory af;
	/**
	 * Constructor, need to know which program(of a specific version) and the ArtifactFactory which has access to the underlaying files
	 */
	public JavaParserImpl(ArtifactFactory af,Program p){
		this.af=af;
		this.p=p;
	}
	
	@Override
	public List<? extends Entity> extractEntities(EntityType type) {
		List<MethodEntity> resultLst = new ArrayList<>();
		if(type.equals(EntityType.METHOD)){
	        CompilationUnit cu;
	        InputStream in;
			for(Path javafile : p.getCodeFiles(CodeKind.SOURCE))
				if(javafile.getFileName().toString().endsWith("java")){
					
					try(in=Files.newInputStream(javafile, options)){
						
						cu=japa.parser.JavaParser.parse(in, encoding);
						MethodVisitor mv = new MethodVisitor();
						mv.visit(cu, null);
						resultLst.addAll(mv.getMethods());
					}catch(){
						
					}
				}
		}		
		return resultLst;
	}

	
	private static class MethodVisitor extends VoidVisitorAdapter{
		List<String> methods;
		
		public MethodVisitor(){
			super();
			methods = new ArrayList<>();
		}
		
		@Override 
		public void visit(MethodDeclaration n,Object arg){
			methods.add(n.getName());
		}
		
		public List<MethodEntity> getMethods(){
			return methods;
		}
		
	}
}
