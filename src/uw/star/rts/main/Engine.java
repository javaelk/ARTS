package uw.star.rts.main;


import uw.star.rts.TCselection.TestCaseSelection;
import uw.star.rts.analysis.TestSubjectAnalysis;
import uw.star.rts.artifact.*;
import uw.star.rts.cost.*;
import uw.star.rts.extraction.*;
import uw.star.rts.goal.*;
import uw.star.rts.technique.*;
import uw.star.rts.util.*;


import org.apache.xmlbeans.*;
import ca.uwaterloo.uw.star.sts.schema.caseStudySubject.*;
import ca.uwaterloo.uw.star.sts.schema.caseStudySubject.CsSubjectDocument.CsSubject;
import ca.uwaterloo.uw.star.sts.schema.stStechniques.ImplementationDocument.Implementation;
import ca.uwaterloo.uw.star.sts.schema.stStechniques.STStechniquesDocument;
import ca.uwaterloo.uw.star.sts.schema.stStechniques.TechniqueDocument.Technique;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.*;

import org.slf4j.*;
import java.util.*;

public class Engine {
	public static String STSGOALSFILE = "STSgoalsFile";
	public static String USERGOALSELELCTION = "UserGoalSelection";
	public static String CASESTUDYSUBJECTFILE = "CaseStudySubjectFile";
	public static String STSTECHNIQUESFILE = "STStechniquesFile";
	public static String EVALUATION="Evaluation";
	public static String TESTSUBJECTANALYSIS="TestSubjectAnalysis";
	
	static Logger log =LoggerFactory.getLogger(Engine.class.getName());
	static Path GoalRepository;
	static Path UserGoalSelection;
	static Path CaseStudySubject;
	static Path STStechniques;
	static boolean evaluationMode;
	static boolean performTestSubjectAnalysis;
	static String experiment_root;


	public static void main(String[] args){

		if(args.length!=1){
			System.out.println("Please provide configuration property file name");
			System.exit(-1);
		}

		getInputFiles(args[0]);

		if(evaluationMode){
			evaluate();
		}else{
			run();
		}
	}

	/**
	 * for production mode run, consider one test subject only, assume there is one and only one  test subject in CaseStudySubject xml file 
	 */
	public static void run(){
		//module 1  
		List<STSGoal> selectedGoals = modelingGoals(GoalRepository,UserGoalSelection);

		//module 2, for run assume there is only one in the file
		Application testSubject = extractInfoFromRepository(CaseStudySubject).get(0);

		//module 3,	
		log.info("3. == Proposing Selection Techniques == ");
		TechniqueFactory tf = new TechniqueFactory(STStechniques);
		log.info("3.1 == Techniques Modeling ==");
		List<uw.star.rts.technique.Technique> techs = tf.techniquesModeling();
	    uw.star.rts.technique.Technique proposedTechnique = proposeSelectionTechnique(tf,techs,testSubject);

		//module 4,
		List<StopWatch> cost = new ArrayList<>();
		for(int i=0;i<testSubject.getTotalNumVersons();i++)
			cost.add(new StopWatch());
		Map<Program,List<TestCase>> selectedTC = TestCaseSelection.applyTechnique(proposedTechnique, testSubject,cost);
	}

	/**
	 * evaluation mode,
	 * loop through all test subjects as in production run mode
	 */
	public static void evaluate(){

		//module 1  
		List<STSGoal> selectedGoals = modelingGoals(GoalRepository,UserGoalSelection);

		//module 2, for evaluation assume there is more than one test subjects
		List<Application> testSubjects = extractInfoFromRepository(CaseStudySubject);

		//module 3,	
		log.info("3. == Proposing Selection Techniques == ");
		TechniqueFactory tf = new TechniqueFactory(STStechniques);
		log.info("3.1 == Techniques Modeling ==");
		List<uw.star.rts.technique.Technique> techs = tf.techniquesModeling();
		//analyze test subjects to confirm assumptions
		if(performTestSubjectAnalysis) 
			TestSubjectAnalysis.analyzeAllFactors(testSubjects);
				
		uw.star.rts.technique.Technique proposedTechnique = proposeSelectionTechnique(tf,techs,testSubjects);
		
		//module 5,
		TestCaseSelection.applyTechniques(techs, testSubjects);
	}

	/**
	 * Create path objects based on the files names given in the property file
	 * @param properties
	 */
	public static void getInputFiles(String propertyFilePath){
		Properties properties = new Properties();
		try{
			properties.load(new FileInputStream(propertyFilePath));	
		}catch(IOException e){
			e.printStackTrace();
			log.error("error in parsing configuration property file : " + propertyFilePath);
		}

		log.info("Create path objects based on the files names given in the property file");
		GoalRepository = Paths.get(properties.getProperty(STSGOALSFILE));
		UserGoalSelection = Paths.get(properties.getProperty(USERGOALSELELCTION));
		CaseStudySubject = Paths.get(properties.getProperty(CASESTUDYSUBJECTFILE));
		STStechniques = Paths.get(properties.getProperty(STSTECHNIQUESFILE));
		String eval = properties.getProperty(EVALUATION);
		evaluationMode =(eval!=null&&eval.equalsIgnoreCase("true"))?true:false;
		String testsubjectAnalysis = properties.getProperty(TESTSUBJECTANALYSIS);
		performTestSubjectAnalysis = (testsubjectAnalysis!=null&&testsubjectAnalysis.equalsIgnoreCase("true"))?true:false;
		experiment_root = properties.getProperty(Constant.EXPERIMENTROOT);
	}

	/**
	 * module 1
	 * 
	 * @return a list of user selected goals from all available goals predefined in the system(all these goals are 
	 * available to all test subjects
	 */
	static List<STSGoal> modelingGoals(Path goalRepository,Path userSelection){
		log.info("1. == modelling goals === "); 
		STSGoal rootGoal = STSGoalFactory.newInstance().modelingGoals(GoalRepository); 
		STSGoalSelection sgs = new STSGoalSelection(rootGoal);
		List<STSGoal> selectedGoals = sgs.select(userSelection);
		log.info("1. == end of module 1, Goals selected == ");
		log.info("User selected goals are : " + selectedGoals);
		return selectedGoals;
	}

	/**
	 * Module 2
	 */
	public static List<Application> extractInfoFromRepository(Path CaseStudySubjectXMLFile){
		log.info("2. == Extracting Information from Repository == ");

		if(Files.notExists(CaseStudySubjectXMLFile)||Files.isDirectory(CaseStudySubjectXMLFile)){
			log.error(CaseStudySubjectXMLFile+" is either not exist or a directory");
			throw new IllegalArgumentException(CaseStudySubjectXMLFile+" is either not exist or a directory");
		}

		//list of test objects provided as xml file
		CasestudySubjectDocument eo = null;
		try{
			eo=CasestudySubjectDocument.Factory.parse(CaseStudySubjectXMLFile.toFile());
		}catch(XmlException e){
			log.error("xml exception" + CaseStudySubjectXMLFile);
			e.printStackTrace();
		}catch(IOException e){
			log.error("IO exception" + CaseStudySubjectXMLFile);
			e.printStackTrace();
		}
		List<Application> resultList = new ArrayList<>();

		//		get all test subjects
		if(eo!=null){
			for(CsSubject caseStudySubject : eo.getCasestudySubject().getCsSubjectArray()){
				ArtifactFactory af = null;
				//TODO: from repository name -> repository factory class, should use classloader as well. 
				if(caseStudySubject.getRepository().equals(Constant.SIR_JAVA)){
					af =  new SIRJavaFactory();
				}else{//add other repositories if exist
					log.error("Error, repository factory "+caseStudySubject.getRepository()+ " is not implemented!");
				}
				//end todo

				if(af!=null){
					log.info("2.1 == Artifacts Modeling ==");
					af.setExperimentRoot(experiment_root);
					Application newApp = af.extract(caseStudySubject.getName(),Enum.valueOf(TraceType.class, caseStudySubject.getTraceType()));
					log.debug("## application details ##:\n" + newApp.toString());
					log.debug("## application stats ##:\n" + newApp.getStats());
					//TODO: log.info("2.2 == Artifacts Validation ==");
					//TODO: log.info("2.3 == Availability Analysis ==");
					resultList.add(newApp);
				}
			}
		}
		return resultList;

	}

	/**
	 * Module 3
	 * save precision prediction, cost prediction and utility values of all techniques into a csv file and return a proposed technique
	 * @return a list of techniques and their implementations 
	 */
	static uw.star.rts.technique.Technique proposeSelectionTechnique(TechniqueFactory tf,List<uw.star.rts.technique.Technique> techs, List<Application> testsubjects){
		techs = tf.filterOnDataAvailability(techs);

		List<String> testSubjectVersions = new ArrayList<>();
		for(Application app: testsubjects){
			String appName = app.getApplicationName();
			for(int i=0;i<app.getTotalNumVersons();i++)
				testSubjectVersions.add(appName+"-v"+i);
		}

		//use a Map to store results,key is technique applied, value is a list of % for all test subjects versions
		//for each technique - test subject version combination, there is a map of <prediction model, precision>
		Map<uw.star.rts.technique.Technique,List<Map<PrecisionPredictionModel,Double>>> predicatedPrecision = new HashMap<>();
		Map<uw.star.rts.technique.Technique,List<Long>> predicatedAnalysisCost = new HashMap<>();
		Map<uw.star.rts.technique.Technique,List<StopWatch>> predicationCost = new HashMap<>();
		
		for(uw.star.rts.technique.Technique tec: techs){
			List<Map<PrecisionPredictionModel,Double>> predicatedPrecisionArrayPerTec = new ArrayList<>();
			List<Long> predicatedAnalysisCostArrayPerTec = new ArrayList<>();
			List<StopWatch> stopwatchArrayPerTec = new ArrayList<>();
			
			for(Application app: testsubjects){
				//predicated precision is the same for all versions of the program(i.e. predication only on v0)
				//call predicatePrecision and predicateAnalysisCost once per application,  no need to loop through all versions.
				tec.setApplication(app);
				//TODO: extract all entities here, at prediction/selection only need to check if it's already extracted.

				for(int i=0;i<app.getTotalNumVersons();i++){ //predict for each version

					Map<PrecisionPredictionModel,Double> precisionPerVersion = new HashMap<>();
					long predicatedAnalysisCostPerVersion = 0L;
					StopWatch sw = new StopWatch();
					
						//get PredicatedPrecision 
						sw.start(CostFactor.PrecisionPredictionCost);
						if(i==0){//first version always select 100%
							for(PrecisionPredictionModel pm: PrecisionPredictionModel.values())//for each predictor 
								precisionPerVersion.put(pm, 1.0);
						}else{
							//prediction is based on information from previous version
							precisionPerVersion = tec.predictPrecision(app.getProgram(ProgramVariant.orig, i-1),app.getProgram(ProgramVariant.orig, i));
						}
						sw.stop(CostFactor.PrecisionPredictionCost);

						//get PredicatedAnalysisCost
						sw.start(CostFactor.AnalysisCostPredictionCost);
						if(i!=0)
							predicatedAnalysisCostPerVersion=tec.predictAnalysisCost();
						sw.stop(CostFactor.AnalysisCostPredictionCost);

					predicatedPrecisionArrayPerTec.add(precisionPerVersion);
					predicatedAnalysisCostArrayPerTec.add(predicatedAnalysisCostPerVersion);
					stopwatchArrayPerTec.add(sw);
				}
			}//end for each test subjects

			predicatedPrecision.put(tec, predicatedPrecisionArrayPerTec);
			predicatedAnalysisCost.put(tec, predicatedAnalysisCostArrayPerTec);
			predicationCost.put(tec, stopwatchArrayPerTec);
		}
		//export to CSV
		ResultOutput.outputEvalResult_Prediction("predicated",predicatedPrecision,predicatedAnalysisCost,testSubjectVersions,predicationCost);

		return techs.get(0);        
	}
	
	static uw.star.rts.technique.Technique proposeSelectionTechnique(TechniqueFactory tf,List<uw.star.rts.technique.Technique> techs, Application testsubjects){
	//TODO: implement me ! 
		return techs.get(0);  
	}
	
}
