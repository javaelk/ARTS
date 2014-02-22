#!/bin/sh -x
export JAVA_HOME=/home/wliu/java/jdk1.7.0_17/bin
echo $JAVA_HOME
export PATH=/home/wliu/java/jdk1.7.0_17/bin:$PATH
echo $PATH

TESTSUBJECT="jacoco_core-TC"
TESTSUBJECT_ALT="jacoco_core"

#Its also worth noting that when you use the  java -jar command line option to run your Java program as an executable JAR, then the CLASSPATH environment variable will be ignored, and also the -cp and -classpath switches will be ignored.
#http://stackoverflow.com/questions/219585/setting-multiple-jars-in-java-classpath

for VER in 0 1 2 3 4 5 6 7 8 9 10 11 12 13
do

	echo " running version $VER" 
	export CLASSPATH="./artsTestPlanGenerator.jar:/home/wliu/workspace/ARTS/lib/*:/home/wliu/sir/$TESTSUBJECT/commonlibs/asm-3.3/lib/*:/home/wliu/sir/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/testcases:/home/wliu/sir/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/classes"
	echo $CLASSPATH

	java -cp $CLASSPATH uw.star.rts.internal.TestPlanGenerator_TestClass /home/wliu/sir/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/src/testcases > /home/wliu/sir/$TESTSUBJECT/testplans.alt/v$VER/v$VER.class.junit.universe.all
read pause
done


