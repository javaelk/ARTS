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

import org.slf4j.LoggerFactory;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;

/**
 * parser specific to SVN log --verbose ouput
 * @author wliu
 *
 */
public class SvnChangeHistoryParser extends ChangeHistoryParser{
	static String SHACODE_PATTERN="^(r[0-9]+).*";
	static String MODIFIED_FILE_PATTERN="^\\s+([MAD]{1})\\s+(.*)$";
	static String COMMIT_SEPARATOR_PATTERN="^-+";
	
	public SvnChangeHistoryParser(Path changeHistoryFile){
		super(changeHistoryFile);
		log = LoggerFactory.getLogger(SvnChangeHistoryParser.class.getName());
		allCommits = parse();
	}
	
	List<Commit> parse(){
		List<Commit> parseResult = new ArrayList<>();
		Charset charset = Charset.forName("UTF-8");
		Pattern shaCodePattern = Pattern.compile(SHACODE_PATTERN);//pre-compile patterns as they are used frequently in the loop
		Pattern modifiedFilePattern = Pattern.compile(MODIFIED_FILE_PATTERN);
		Pattern commitSeparatorPattern = Pattern.compile(COMMIT_SEPARATOR_PATTERN);
		
		try(BufferedReader reader = Files.newBufferedReader(changeHistoryFile, charset)){
			String line = null;
			Commit aCommit = null;
			Multimap<String,String> modifiedFilesMap = null;
			while((line=reader.readLine())!=null){
				Matcher matcher_shaCodePattern = shaCodePattern.matcher(line);
				Matcher matcher_modifiedFilePattern = modifiedFilePattern.matcher(line);
                Matcher matcher_commitSeparatorPattern = commitSeparatorPattern.matcher(line);
                
				if(matcher_shaCodePattern.matches()){ //line contains sha code
				   log.debug("line: " + line + " matches " + matcher_shaCodePattern.group(1));
				   aCommit = new Commit(matcher_shaCodePattern.group(1));
				   modifiedFilesMap = HashMultimap.create(); //The multimap does not store duplicate key-value pairs.
				   aCommit.setModifiedFilesMap(modifiedFilesMap);
				}else if(matcher_modifiedFilePattern.matches()){//line contain modified file
					if(aCommit!=null){
						modifiedFilesMap.put(matcher_modifiedFilePattern.group(1), matcher_modifiedFilePattern.group(2));
					   	log.debug("line:" + line + " matches " + matcher_modifiedFilePattern.group(1));
					}else{
						log.error("find " + line + " but there is no sha code line before it");
					}
				}else if(matcher_commitSeparatorPattern.matches()){ // this is a separator line ----
					   if(aCommit!=null)
						   parseResult.add(aCommit);  //push last commit into result list
				}
			}
		
		}catch(IOException e){
			log.error("error in reading file " + changeHistoryFile);
			e.printStackTrace();
		}
		return parseResult;
	
	}
}
