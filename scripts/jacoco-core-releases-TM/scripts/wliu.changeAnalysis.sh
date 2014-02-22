#!/bin/bash -x

TESTSUBJECT="jacoco-core-releases-TM"
TESTSUBJECT_ALT="jacoco_core"
BEAUTIFIEDSRC=${experiment_root}/$TESTSUBJECT/versions.alt
CODEVARIANT="orig"


echo "diff beautified versions" 
cd $experiment_root/$TESTSUBJECT/changes

for VERA in 0 1 2 3 4 5 6 7 8 9 10 11 12
do

	let "VERB=$VERA+1"
	diff --ignore-case --ignore-all-space --ignore-blank-lines --recursive $BEAUTIFIEDSRC/$CODEVARIANT/v$VERA/$TESTSUBJECT_ALT/build/src/main $BEAUTIFIEDSRC/$CODEVARIANT/v$VERB/$TESTSUBJECT_ALT/build/src/main |egrep -v "\---|>|<" > changes${CODEVARIANT}v${VERA}${CODEVARIANT}v${VERB}.txt

done

