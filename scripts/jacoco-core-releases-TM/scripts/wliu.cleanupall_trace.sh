#!/bin/bash -xv
echo "this script will clean up all traces"

TESTSUBJECT="jacoco-core-releases-TM"
TESTSUBJECT_ALT="jacoco_core"

echo "remove all trace results"

for VER in {0..13}
do
	cd ${experiment_root}/$TESTSUBJECT/traces.alt/CODECOVERAGE/orig
	rm -rf html/v$VER/*
	rm -rf v$VER/*
done

echo "clean up outputs"
rm -rf ${experiment_root}/$TESTSUBJECT/outputs/*
rm ${experiment_root}/$TESTSUBJECT/scripts/TestScripts/*.log
rm ${experiment_root}/$TESTSUBJECT/changes/*





