#!/bin/bash -xv
TESTSUBJECT="apache-xml-security-releases-TC"
TESTSUBJECT_ALT="xml-security"
SVNLOCAL="${experiment_root}/apache-xml-security"

unset CLASSPATH
CLASSPATH=.:$SVNLOCAL/source/$TESTSUBJECT_ALT/build/classes:$SVNLOCAL/source/$TESTSUBJECT_ALT/build/tests:$SVNLOCAL/source/$TESTSUBJECT_ALT/build/samples

for i in $SVNLOCAL/common/libs/*.jar
do
    CLASSPATH=$CLASSPATH:$i
done

export CLASSPATH

