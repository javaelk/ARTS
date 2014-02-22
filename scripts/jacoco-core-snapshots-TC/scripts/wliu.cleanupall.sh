#!/bin/bash -xv
echo "this script will clean up everything"

TESTSUBJECT="jacoco-core-snapshots-TC"
TESTSUBJECT_ALT="jacoco_core"
GITNAME="jacoco_snapshots"

echo "remove all build class and source files in versions.alt"
echo "remove all trace results"

for VER in {0..8..1}
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
rm -rf $HOME/git/$GITNAME
rm -rf $experiment_root/$GITNAME





