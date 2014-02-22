#!/bin/bash -xv
echo "this script runs tests and collects trace, output is a set of trace output files" 

TESTSUBJECT="jacoco-core-releases-TM"
SVNLOCAL="$experiment_root/jacoco_tags"
b=0
for VER in v0.5.0 v0.5.1 v0.5.2 v0.5.3 v0.5.4 v0.5.5 v0.5.6 v0.5.7 v0.5.8 v0.5.9 v0.5.10 v0.6.0 v0.6.1 v0.6.2
do

cd $SVNLOCAL/$VER/org.jacoco.core.test
$experiment_root/$TESTSUBJECT/scripts/TestScripts/scriptR${b}coverage.cls > $experiment_root/$TESTSUBJECT/outputs/runv${b}.log 2>&1
mkdir $experiment_root/$TESTSUBJECT/outputs/$VER
mv $experiment_root/$TESTSUBJECT/outputs/t* $experiment_root/$TESTSUBJECT/outputs/$VER

let " b +=1 " 
done




