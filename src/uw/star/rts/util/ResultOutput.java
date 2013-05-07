package uw.star.rts.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import uw.star.rts.cost.CostFactor;
import uw.star.rts.cost.PrecisionPredictionModel;
import uw.star.rts.technique.Technique;

public class ResultOutput {
	
	static boolean OUTPUTCOST=true;
	
	public static Path outputEvalResult_Prediction(String firstCellHeader,Map<uw.star.rts.technique.Technique,List<Map<PrecisionPredictionModel,Double>>> precision,Map<uw.star.rts.technique.Technique,List<Long>> predicatedAnalysisCost, List<String> testSubjectVersions,Map<uw.star.rts.technique.Technique,List<StopWatch>> actualCost){
		Path outputFile = Paths.get("output"+File.separator+"evaluationResult_"+firstCellHeader+"_"+DateUtils.now("MMMdd_HHmm")+".csv");
		Charset charset = Charset.forName("UTF-8");

		try(BufferedWriter writer = Files.newBufferedWriter(outputFile,charset,StandardOpenOption.WRITE,StandardOpenOption.CREATE,StandardOpenOption.TRUNCATE_EXISTING)){
			//write column headers,1st row
			writer.write(firstCellHeader);
			List<Technique> techs = new ArrayList<>(precision.keySet());
			for(Technique tech: techs ){
				for(PrecisionPredictionModel pm:PrecisionPredictionModel.values()){
				writer.write(","+tech.getID()+"-"+tech.getDescription()+"-"+tech.getImplmentationName()+"-"+pm+"_precision");
				if(OUTPUTCOST&&predicatedAnalysisCost!=null)
					writer.write(",PredicatedAnalysisCost(ms)");
				//add cost columns if exists
				if(OUTPUTCOST&&actualCost !=null)
					for(CostFactor cf: CostFactor.values())
						if(!(firstCellHeader.equalsIgnoreCase("predicated")^cf.isPredicationCost()))
								writer.write(","+tech.getID()+"-"+cf.name()+"(ms)");
				}
					
			}
			writer.write("\n");

			//for each row, write application-version on the 1st column, then % actual/predicated for each technique
			for(int i=0;i<testSubjectVersions.size();i++){
				writer.write(testSubjectVersions.get(i));
				for(Technique tec: techs){
					for(PrecisionPredictionModel pm:PrecisionPredictionModel.values()){
					writer.write(","+precision.get(tec).get(i).get(pm));
					if(OUTPUTCOST&&predicatedAnalysisCost!=null)
						writer.write(","+predicatedAnalysisCost.get(tec).get(i));
						
					//add cost values if exists
					if(OUTPUTCOST&&actualCost !=null)
						for(CostFactor cf: CostFactor.values())
							if(!(firstCellHeader.equalsIgnoreCase("predicated")^cf.isPredicationCost()))
							writer.write(","+actualCost.get(tec).get(i).getElapsedTime(cf));
					}
					
				}
				writer.write("\n");
			}
		}catch(IOException ec){
			ec.printStackTrace();
		}
		return outputFile;
	}

	public static Path outputEvalResult_Actual(String firstCellHeader,Map<Technique,List<Double>> precision,Map<Technique,List<Long>> predicatedAnalysisCost, List<String> testSubjectVersions,Map<Technique,List<StopWatch>> actualCost){
		Path outputFile = Paths.get("output"+File.separator+"evaluationResult_"+firstCellHeader+"_"+DateUtils.now("MMMdd_HHmm")+".csv");
		Charset charset = Charset.forName("UTF-8");

		try(BufferedWriter writer = Files.newBufferedWriter(outputFile,charset,StandardOpenOption.WRITE,StandardOpenOption.CREATE,StandardOpenOption.TRUNCATE_EXISTING)){
			//write column headers,1st row
			writer.write(firstCellHeader);
			List<Technique> techs = new ArrayList<>(precision.keySet());
			for(Technique tech: techs ){
				writer.write(","+tech.getID()+"-"+tech.getDescription()+"-"+tech.getImplmentationName()+"_precision");
				if(OUTPUTCOST&&predicatedAnalysisCost!=null)
					writer.write(",PredicatedAnalysisCost(ms)");
				//add cost columns if exists
				if(OUTPUTCOST&&actualCost !=null)
					for(CostFactor cf: CostFactor.values())
						if(!(firstCellHeader.equalsIgnoreCase("predicated")^cf.isPredicationCost()))
								writer.write(","+tech.getID()+"-"+cf.name()+"(ms)");
					
			}
			writer.write("\n");

			//for each row, write application-version on the 1st column, then % actual/predicated for each technique
			for(int i=0;i<testSubjectVersions.size();i++){
				writer.write(testSubjectVersions.get(i));
				for(Technique tec: techs){
					writer.write(","+precision.get(tec).get(i));
					if(OUTPUTCOST&&predicatedAnalysisCost!=null)
						writer.write(","+predicatedAnalysisCost.get(tec).get(i));
						
					//add cost values if exists
					if(OUTPUTCOST&&actualCost !=null)
						for(CostFactor cf: CostFactor.values())
							if(!(firstCellHeader.equalsIgnoreCase("predicated")^cf.isPredicationCost()))
							writer.write(","+actualCost.get(tec).get(i).getElapsedTime(cf));
					
				}
				writer.write("\n");
			}
		}catch(IOException ec){
			ec.printStackTrace();
		}
		return outputFile;
	}
	
	/**
	 * a generic output method
	 */
	public static Path outputResult(String outputFileName, List<String> header, Map<String,List<String>> rows){
		Path outputFile = Paths.get("output"+File.separator+outputFileName+"_"+DateUtils.now("MMMdd_HHmm")+".csv");
		Charset charset = Charset.forName("UTF-8");

		try(BufferedWriter writer = Files.newBufferedWriter(outputFile,charset,StandardOpenOption.WRITE,StandardOpenOption.CREATE,StandardOpenOption.TRUNCATE_EXISTING)){
			//write column headers,1st row
			for(String columnName: header)
				writer.write(columnName +",");
			writer.write("\n");

			//for each row,
				for(String key: rows.keySet()){
					writer.write(key+",");
					for(String value:rows.get(key))
						writer.write(value+",");
					writer.write("\n");
				}
		}catch(IOException ec){
			ec.printStackTrace();
		}
		return outputFile;
	}
	
	
}
