#!/bin/bash
MY_DIR=$(dirname $(readlink -f $0))
source $MY_DIR/header.sh

CLASSPATH="$CLASSPATH":.
export CLASSPATH
cwd=`pwd`
cd ${experiment_root}/$TESTSUBJECT/source/$TESTSUBJECT_ALT
if [ $# -lt 1 ]; then
    echo "usage: $0 <version>"
    echo "version 1...3"
    exit 1
fi

if [ ${1} -ge 3 ]; then
    ./build.sh compile.tests
else
    ./build.sh compile
fi
cd $cwd
