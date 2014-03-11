package uw.star.rts.changeHistory;

import java.nio.file.Path;
import java.util.List;

import org.slf4j.Logger;
import uw.star.rts.artifact.EntityType;

import com.google.common.collect.HashMultiset;
import com.google.common.collect.Multiset;

public abstract class ChangeHistoryParser {
	Path changeHistoryFile; //this file is the output from a script
	Logger log;
	List<Commit> allCommits;
	
	ChangeHistoryParser(Path changeHistoryFile){
		this.changeHistoryFile = changeHistoryFile;
	}
	
	abstract List<Commit> parse();
	/**
	 * Average amount of code changes per commit up to version sha code (not including the given version) 
	 * this counts Modified and Deleted files for now to match with ARTS diff
	 * if given shacode does not exist in the changeHistory file, return average of all commits
	 * @param type
	 * @param shaCode
	 * @return
	 */
	public double averageAmountOfCodeChanges(EntityType type,String shaCode){
		if(type!=EntityType.SOURCE)
			throw new IllegalArgumentException("entity type " + type + " is not yet implemented");
    	int sum =0;
    	int numVersion =0;
    	for(int i=allCommits.size()-1;i>=0;i--){ 
    		Commit c = allCommits.get(i);
    		if(c.shaCode.equals(shaCode))
    			 break;
    		sum += c.getModifiedFilesMap().get("M").size()+ c.getModifiedFilesMap().get("D").size();
    		numVersion++;
    	}
		return (numVersion==0)?0.0:(sum*1.0)/numVersion;
    }
	
	/*
	 * @return key is the entity name, Integer is number of times the entity was modified since the beginning of the 
	 * code line till version shaCode. This counts the number of modification and deletion (if any), it does not count add.
	 * 
	 */
	public Multiset<String> getChangeFrequency(EntityType type,String shaCode){
		if(type!=EntityType.SOURCE)
			throw new IllegalArgumentException("entity type " + type + " is not yet implemented");
		Multiset<String> resultSet = HashMultiset.create();
    	for(int i=allCommits.size()-1;i>=0;i--){ 
    		Commit c = allCommits.get(i);
    		if(c.shaCode.equals(shaCode))
    			 break;
    		resultSet.addAll(c.getModifiedFilesMap().get("M"));
    		resultSet.addAll(c.getModifiedFilesMap().get("D"));
    	}
		return resultSet;
	}


}
