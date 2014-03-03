#!/bin/bash -xv
echo "this script will clean up everything"
MY_DIR=$(dirname $(readlink -f $0))
source $MY_DIR/header.sh

echo "remove all build class and source files in versions.alt"
rm -rf $experiment_root/$TESTSUBJECT/versions.alt/orig/*

echo "remove all trace results"
./wliu.cleanupTrace.sh

echo "clean up changes"
rm ${experiment_root}/$TESTSUBJECT/changes/*

echo "clean up SVNLOCAL"
rm -rf $SVNLOCAL

#echo " clean up test plan and test execution scripts" 


