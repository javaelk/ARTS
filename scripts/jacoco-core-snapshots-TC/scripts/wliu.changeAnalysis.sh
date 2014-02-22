#!/bin/bash -x

TESTSUBJECT="jacoco-core-snapshots-TC"
TESTSUBJECT_ALT="jacoco_core"
BEAUTIFIEDSRC=${experiment_root}/$TESTSUBJECT/versions.alt
CODEVARIANT="orig"


echo "diff beautified versions" 
cd $experiment_root/$TESTSUBJECT/changes

for VERA in {0..7}
do

	let "VERB=$VERA+1"
	diff --ignore-case --ignore-all-space --ignore-blank-lines --recursive $BEAUTIFIEDSRC/$CODEVARIANT/v$VERA/$TESTSUBJECT_ALT/build/src/main $BEAUTIFIEDSRC/$CODEVARIANT/v$VERB/$TESTSUBJECT_ALT/build/src/main |egrep -v "\---|>|<" > changes${CODEVARIANT}v${VERA}${CODEVARIANT}v${VERB}.txt

done

