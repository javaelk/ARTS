package uw.star.rts.artifact;

import java.util.*;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.*;

import com.google.common.collect.HashMultiset;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Multiset;

/**
 * Coverage represents coverage relation between test cases and an entity type E over execution of a Program p.
 * Coverage is a special type of Trace that row type is always test case and column type is always a subtype of Entity  
 * @author wliu
 *
 */
public class  CodeCoverage<E extends Entity> extends Trace<TestCase, E>{

	
	public  CodeCoverage(TraceType traceType, List<TestCase> testcases,List<E> entities,Path coverageFilesFolder){
		super(traceType,testcases, entities,coverageFilesFolder);	
		//as CodeCoverage represent coverage of a list of test cases, there are multiple files, so the path is the folder contains all coverage files
	}

	
	/*
	 * DEFINITION: Coverage Matrix C(i,j) - Each row represent elements of T,
	 * each column represent elements of E(entity) element C(i,j) = 1 if Ti
	 * covers Ej, otherwise 0
	 * 
	 * @a two dimensional array, row is test case, column is entity
	 */
	public int[][] getCoverageMatrix() {
		return getLinkMatrix();
	}
	
	/**
	 * CC is the amount of cumulative coverage of achieved by T (i.e the integer
	 * sum of the entries in the coverage matrix
	 * 
	 * @return
	 */
	public int getCumulativeCoverage() {
		int sum = 0;
		for (int i = 0; i < row.size(); i++)
			for (int j = 0; j < column.size(); j++)
				sum += links[i][j];
		return sum;
	}
	
	/**
	 * CC is the amount of cumulative coverage of achieved by T (i.e the integer
	 * sum of the entries in the coverage matrix
	 * 
	 * @return cumulative coverage incurred by the given test case set, this is normally the set of test cases with obsolete ones removed.
	 */
	public int getCumulativeCoverage(List<TestCase> regressionTests) {
		int sum = 0;
		for(TestCase t:regressionTests)
				sum += this.getLinkedEntitiesByRow(t).size();
		return sum;
	}
	
	
	/**
	 * Let Ec denote the set of covered entities. Ec is defined as follows:
	 * Ec =for every e in E, there exist a t in T that covers e. i.e entity e is covered by at least one t
	 * @return all covered entities in the Coverage Matrix
	 */
	
	public List<E> getCoveredEntities(){
		Set<E> results = new HashSet<>();
		for(int j=0;j<column.size();j++){//search column by column (for each entity) 
			for(int i=0;i<row.size();i++){
				if(links[i][j]>0){  //there is a test in i covers entity at j
					results.add(column.get(j));
					break;//don't need to search rest of the rows, jump to next column
				}
			}
		}
		return new ArrayList<E>(results);
	}
	
	/*
	 * @return entities covered by given list of test cases
	 */
	
	public List<E> getCoveredEntities(List<TestCase> testcases){
		Set<E> coveredEntities = new HashSet<>();
		for(TestCase test: testcases)
		   coveredEntities.addAll(this.getLinkedEntitiesByRow(test));
	
		return new ArrayList<E>(coveredEntities);
	}
	
	/**
	 * Compare this code coverage matrix with another code coverage matrix to find out total number of changed elements
	 * this method compares every testcase/entity combination in the current matrix with given matrix.
	 * A change from a zero to a one or from a one to a zero represents one element change.
	 * @param <T>
	 * @param lastVer - another code coverage matrix to compare to
	 * @return total number of changed element
	 */
	public int diff(CodeCoverage lastVer,Comparator cp){

		int[] rowmap = new int[this.links.length];
		int[] colmap = new int[this.links[0].length];
		//initialize every element as -1
		for(int i=0;i<rowmap.length;i++)
			rowmap[i]=-1;
		for(int i=0;i<colmap.length;i++)
			colmap[i]=-1;
		
		for(int i=0;i<rowmap.length;i++)
			rowmap[i] =  lastVer.getRows().indexOf(this.row.get(i));

		for(int i=0;i<colmap.length;i++)
			for(int j=0;j<lastVer.getColumns().size();j++)
				if(cp.compare(this.column.get(i), lastVer.getColumns().get(j))==0){
					colmap[i] = j;
					break;
				}
		int diffsum = 0;
		for (int i = 0; i < row.size(); i++)
			for (int j = 0; j < column.size(); j++)
				if(rowmap[i]>=0&&colmap[j]>=0&&this.links[i][j]!=lastVer.links[rowmap[i]][colmap[j]])
					diffsum++;
		return diffsum;
	}
	
	/**
	 * Create a histogram of this trace matrix
	 * 1. count #of test cases covers each entity
	 * 2. count #of entities covered by exactly n number of test cases
	 * 3. create an csv output of #of entities and #of test cases  
	 * @param outputFile
	 */
	public Multiset<Integer> createHistogram(){
		Multiset<Integer> entityTestCaseBag = HashMultiset.create();
		//for each column, do a sum
		for(int j=0;j<column.size();j++){
			int sum=0;
			for(int i=0;i<row.size();i++)
				sum += links[i][j];
		    entityTestCaseBag.add(sum);
		}
		return entityTestCaseBag;

	}
	
	public void outputHistogram(Path outputFile){
		Multiset<Integer> entityTestCaseBag = createHistogram();
		Charset charset = Charset.forName("UTF-8");
		try(BufferedWriter writer = Files.newBufferedWriter(outputFile,charset,StandardOpenOption.WRITE,StandardOpenOption.CREATE,StandardOpenOption.TRUNCATE_EXISTING)){
			writer.write("#of test cases,#of entities covered by exactly t test cases\n");
			for(int i=0;i<row.size()+1;i++)
				writer.write(i+","+entityTestCaseBag.count(i)+"\n");
		}catch(IOException e){
			log.error("error in writing to file " + outputFile.getFileName());
			e.printStackTrace();
		}
	}
	/**
	 * Transform the code coverage matrix based on inbound dependency information
	 * for each entity e' in inboundDependentEntities
     * merge test cases covers e' into e
     * @param e - entity column which will be modified to merge other test cases into
	 * @param inboundDependentEntities - list of entities (in names) the dependent on e,i.e. modification of e would require tests of every ePrime to be selected too.
	 * @return a transformed codecoverage matrix , original code coverage is not modified
	 */
	public CodeCoverage transform(E e,List<String> inboundDependentEntities){
		CodeCoverage newcc = this.createImmutableCopy();
	    int ecol = column.indexOf(e);  //column number of e
		for(int j=0;j<column.size();j++){
	    	for(String ePrime : inboundDependentEntities){
	    		if(column.get(j).getName().equals(ePrime)) //column number of ePrime is j
	    		    newcc.merge(j,ecol);
	    	}
	    }
		return newcc;
	}
	
	/**
	 * @return an immutable copy of this CodeCoverage with the same coverage information. O 
	 */
    public CodeCoverage<E> createImmutableCopy(){
    	CodeCoverage<E> newcc = new CodeCoverage<E>(this.traceType,ImmutableList.copyOf(this.row),ImmutableList.copyOf(this.column),this.artifactPath);
    	newcc.setLink(this.getLinkMatrix());
    	return newcc;
    }
	
}
