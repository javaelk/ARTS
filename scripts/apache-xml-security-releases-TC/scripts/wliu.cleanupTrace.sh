#!/bin/bash -x


MY_DIR=$(dirname $(readlink -f $0))
source $MY_DIR/header.sh

rm $experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.exec
rm $experiment_root/$TESTSUBJECT/scripts/TestScripts/log.txt

cd ${experiment_root}/$TESTSUBJECT/traces.alt/CODECOVERAGE/orig

rm -rf v*/*
rm -rf html/v*/*
rm -rf ${experiment_root}/$TESTSUBJECT/outputs/*



