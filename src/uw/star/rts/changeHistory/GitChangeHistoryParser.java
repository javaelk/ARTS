package uw.star.rts.changeHistory;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import org.slf4j.LoggerFactory;

public class GitChangeHistoryParser extends ChangeHistoryParser {
	
	static String SHACODE_PATTERN="^commit\\s+([0-9a-f]*)$";  //beginning line commit following with white space and hexdecimal sha code
	static String MODIFIED_FILE_PATTERN="^([MAD]{1})\\s+(.*)$";  //begins with exactly 1 M,A or D and some white space then a file path
	
	public GitChangeHistoryParser(Path changeHistoryFile){
		super(changeHistoryFile);
		log = LoggerFactory.getLogger(GitChangeHistoryParser.class.getName());
		allCommits = parse();
	}
	/*
	 * parse the chagneHistory file and store the information as a list of commits
     * this assumes the change history file is already order by date , latest date on the top of the file(descending order)
	 */
	List<Commit> parse(){
		List<Commit> parseResult = new ArrayList<>();
		Charset charset = Charset.forName("US-ASCII");
		Pattern shaCodePattern = Pattern.compile(SHACODE_PATTERN);//pre-compile patterns as they are used frequently in the loop
		Pattern modifiedFilePattern = Pattern.compile(MODIFIED_FILE_PATTERN);
		
		try(BufferedReader reader = Files.newBufferedReader(changeHistoryFile, charset)){
			String line = null;
			Commit aCommit = null;
			Multimap<String,String> modifiedFilesMap = null;
			while((line=reader.readLine())!=null){
				Matcher matcher_shaCodePattern = shaCodePattern.matcher(line);
				Matcher matcher_modifiedFilePattern = modifiedFilePattern.matcher(line);

				if(matcher_shaCodePattern.matches()){ //line contains sha code
				   //log.debug("line: " + line + " matches " + matcher_shaCodePattern.group(1));
				   if(aCommit!=null)
					   parseResult.add(aCommit);  //push last commit into result list
				   aCommit = new Commit(matcher_shaCodePattern.group(1));
				   modifiedFilesMap = HashMultimap.create(); //The multimap does not store duplicate key-value pairs.
				   aCommit.setModifiedFilesMap(modifiedFilesMap);
				}else if(matcher_modifiedFilePattern.matches()){//line contain modified file
					if(aCommit!=null){
						modifiedFilesMap.put(matcher_modifiedFilePattern.group(1), matcher_modifiedFilePattern.group(2));
					 //  	log.debug("line:" + line + " matches " + matcher_modifiedFilePattern.group(1));
					}else{
						log.error("find " + line + " but there is no sha code line before it");
					}
				}
			}
			   if(aCommit!=null)
				   parseResult.add(aCommit);  //push last commit into result list
		
		}catch(IOException e){
			log.error("error in reading file " + changeHistoryFile);
			e.printStackTrace();
		}
		return parseResult;
	}
    
}
