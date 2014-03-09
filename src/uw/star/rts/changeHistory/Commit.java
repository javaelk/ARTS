package uw.star.rts.changeHistory;

import java.util.Date;
import java.util.Map;
import com.google.common.collect.Multimap;

/**
 * This represents a commit
 * @author wliu
 *
 */
public class Commit {
	String shaCode; //Mandatory field
	String author;
	Date commitDate;
	String commitMessage;
	Multimap<String,String> modifiedFilesMap; //"op code -M,A,D","relative path of file names"

	public Commit(String sha){
		this.shaCode = sha;
	}
    
	public void setModifiedFilesMap(Multimap<String,String> modifiedFilesMap){
		this.modifiedFilesMap = modifiedFilesMap;
	}
	
	public Multimap<String,String> getModifiedFilesMap(){
		return modifiedFilesMap;
	}
}
