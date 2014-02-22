#!/bin/bash -x
echo "version sourceFileName(without .java) classFileName(without .class)"

TESTSUBJECT="jacoco-core-releases-TC"
TESTSUBJECT_ALT="jacoco_core"
SRCPATH2="$experiment_root/$TESTSUBJECT/versions.alt/orig/v$1/$TESTSUBJECT_ALT/build/src/main"
CLSPATH2="$experiment_root/$TESTSUBJECT/versions.alt/orig/v$1/$TESTSUBJECT_ALT/build/classes"
let LASTVERSION=$1-1
SRCPATH1="$experiment_root/$TESTSUBJECT/versions.alt/orig/v$LASTVERSION/$TESTSUBJECT_ALT/build/src/main"
CLSPATH1="$experiment_root/$TESTSUBJECT/versions.alt/orig/v$LASTVERSION/$TESTSUBJECT_ALT/build/classes"

#==diff source first"
SRCFILEPATH=`echo $2 | sed 's/\./\//g'`
CLSCFILEPATH=`echo $3 | sed 's/\./\//g'`
DIFFRESULT=`diff -Bw ${SRCPATH1}/${SRCFILEPATH}.java ${SRCPATH2}/${SRCFILEPATH}.java`

if [ -z $DIFFRESULT] 
 then
	 echo "source file $SRCFILEPATH.java are identical in version v$LASTVERSION and v$1"
fi

#diff class files
/media/data/wliu/ARTSRun/md5.sh ${CLSPATH1}/${CLSCFILEPATH}.class ${CLSPATH2}/${CLSCFILEPATH}.class  

cd ${CLSPATH1}
javap -v ${CLSCFILEPATH} > $experiment_root/$TESTSUBJECT/outputs/v$LASTVERSION.$2.javap
cd ${CLSPATH2}
javap -v ${CLSCFILEPATH} > $experiment_root/$TESTSUBJECT/outputs/v$1.$2.javap
cd $experiment_root/$TESTSUBJECT/outputs

diff v$LASTVERSION.$2.javap v$1.$2.javap

