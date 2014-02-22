#!/bin/bash -xv
TESTSUBJECT="jacoco-core-snapshots-TC"
TESTSUBJECT_ALT="jacoco_core"
SVNLOCAL="$experiment_root/jacoco_snapshots"

for VER in {0..8..1}
do

cd $SVNLOCAL/v$VER/org.jacoco.core.test
$experiment_root/$TESTSUBJECT/scripts/TestScripts/scriptR${VER}coverage.cls > $experiment_root/$TESTSUBJECT/outputs/runv${VER}.log 2>&1
mkdir $experiment_root/$TESTSUBJECT/outputs/v$VER
mv $experiment_root/$TESTSUBJECT/outputs/t* $experiment_root/$TESTSUBJECT/outputs/v$VER
done


