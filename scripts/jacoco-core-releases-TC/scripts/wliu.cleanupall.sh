#!/bin/bash -xv
echo "this script will clean up everything"

TESTSUBJECT="jacoco-core-releases-TC"
TESTSUBJECT_ALT="jacoco_core"

echo "remove all build class and source files in versions.alt"
echo "remove all trace results"

for VER in {0..13}
do
	cd $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build
	rm -rf classes
	rm -rf src
	rm -rf testcases

	cd ${experiment_root}/$TESTSUBJECT/traces.alt/CODECOVERAGE/orig
	rm -rf html/v$VER/*
	rm -rf v$VER/*
done

echo "clean up outputs"
rm -rf ${experiment_root}/$TESTSUBJECT/outputs/*
rm ${experiment_root}/$TESTSUBJECT/changes/*
rm -rf $HOME/git/jacoco_tags
rm -rf ${experiment_root}/jacoco_tags




