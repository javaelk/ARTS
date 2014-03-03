#!/bin/bash

MY_DIR=$(dirname $(readlink -f $0))
source $MY_DIR/header.sh

if [ $# -lt 2 ]; then
    echo "install.sh <orig | seeded> <version-number>"
    echo "version number 0...3"
    echo "Must give version number to install"
    exit 1
fi

if [ ! -d ${experiment_root}/$TESTSUBJECT/versions.alt/${1}/v${2} ]; then
    echo "Invalid version number"
    exit 1
fi

if [ -d ${experiment_root}/$TESTSUBJECT/source/xml-security ]; then
    rm -rf ${experiment_root}/$TESTSUBJECT/source/xml-security
fi

echo installing ${1} version ${2}...

cp -rf ${experiment_root}/$TESTSUBJECT/versions.alt/${1}/v${2}/xml-security ${experiment_root}/$TESTSUBJECT/source
if [ ! -d ${experiment_root}/$TESTSUBJECT/common ]; then
    echo copying common directory...	
    cp -rf ${experiment_root}/$TESTSUBJECT/versions.alt/${1}/common ${experiment_root}/apache-xml-security
fi
# don't build yet, use build.sh or build_faulted.sh to finish install
#echo build.sh...
#${experiment_root}/apache-xml-security/scripts/build.sh ${2}
