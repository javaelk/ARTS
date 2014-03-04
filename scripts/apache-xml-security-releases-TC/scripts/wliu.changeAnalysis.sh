#!/bin/bash -x

MY_DIR=$(dirname $(readlink -f $0))
source $MY_DIR/header.sh

BEAUTIFIEDSRC=${experiment_root}/$TESTSUBJECT/versions.alt
CODEVARIANT="orig"

echo "diff beautified versions" 
cd $experiment_root/$TESTSUBJECT/changes

for VERA in {0..2}
do

	let "VERB=$VERA+1"
	diff --ignore-case --ignore-all-space --ignore-blank-lines --recursive $BEAUTIFIEDSRC/$CODEVARIANT/v$VERA/$TESTSUBJECT_ALT/build/src $BEAUTIFIEDSRC/$CODEVARIANT/v$VERB/$TESTSUBJECT_ALT/build/src |egrep -v "\---|>|<" > changes${CODEVARIANT}v${VERA}${CODEVARIANT}v${VERB}.txt
done
