#!/bin/sh -x 
TESTSUBJECT="jacoco-core-snapshots-TM"
TESTSUBJECT_ALT="jacoco_core"
TESTSCRIPT_DIR="$experiment_root/$TESTSUBJECT/scripts/TestScripts"
VER=$2

unset CLASSPATH
echo ">>>>>>>>generating coverage of $1"
mv ./jacoco.exec $TESTSCRIPT_DIR
/home/wliu/java/apache-ant-1.8.2/bin/ant -buildfile $TESTSCRIPT_DIR/JacocoReport.$VER.xml

mv $TESTSCRIPT_DIR/target/site/$TESTSUBJECT_ALT/report.xml $experiment_root/$TESTSUBJECT/traces.alt/CODECOVERAGE/orig/$VER/coverage.$1.xml
mv $TESTSCRIPT_DIR/jacoco.exec $experiment_root/$TESTSUBJECT/traces.alt/CODECOVERAGE/orig/html/$VER/coverage.$1.exec
mv $TESTSCRIPT_DIR/target/site/$TESTSUBJECT_ALT $experiment_root/$TESTSUBJECT/traces.alt/CODECOVERAGE/orig/html/$VER/coverage.$1
rm -rf $TESTSCRIPT_DIR/target
