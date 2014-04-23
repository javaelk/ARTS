#!/bin/bash -xv
TESTSUBJECT="jacoco-core-releases-TC"
TESTSUBJECT_ALT="jacoco_core"
echo " this script fetches source from github, build and deploy to sir verions.alt directory"
echo "fetch from github" 
cd $HOME/git
mkdir jacoco_tags
cd jacoco_tags
git init
git clone https://github.com/jacoco/jacoco.git
cd jacoco
ls

echo "archive "
for VER in v0.5.0 v0.5.1 v0.5.2 v0.5.3 v0.5.4 v0.5.5 v0.5.6 v0.5.7 v0.5.8 v0.5.9 v0.5.10 v0.6.0 v0.6.1 v0.6.2
do 
 git archive --format=tar.gz $VER > jacoco-$VER.tar.gz
done
ls


echo "deploy "
cd $experiment_root
mkdir jacoco_tags
cd jacoco_tags

a=0
for VER in v0.5.0 v0.5.1 v0.5.2 v0.5.3 v0.5.4 v0.5.5 v0.5.6 v0.5.7 v0.5.8 v0.5.9 v0.5.10 v0.6.0 v0.6.1 v0.6.2
do
  echo "untar $VER and build" 
  mkdir $VER
  cd $VER
  tar xvzf $HOME/git/jacoco_tags/jacoco/jacoco-$VER.tar.gz

#beautify
$HOME/java/Jindent/Jindent -J-Xms256M -J-Xmx256M -r -p $HOME/java/Jindent/RTS.xjs org.jacoco.core/src/*.java

#remove comments from src code
$experiment_root/workspace/pretty/pretty.sh org.jacoco.core/src

#remove all blank lines from src code
$experiment_root/workspace/pretty/removeBlankLines.sh org.jacoco.core/src

#fix licese header issue
if [ -f org.jacoco.build/license-header.txt ]
 then 
 >org.jacoco.build/license-header.txt
fi

if [ -f org.jacoco.build/pom.xml ]
 then
    sed -i 's~\*\*\/\*\.java,\*\*\/\*\.xml~**/*.notjava,**/*.xml~' org.jacoco.build/pom.xml
fi

#some older versions do not have pom.xml in jacoco directory 
  if [ -f pom.xml ]
    then  
    mvn package -DskipTests
    else
    cd org.jacoco.build    
    mvn package -DskipTests
    cd ..
  fi

  echo "create & clean up build directory v$a before copy" 
  mkdir $experiment_root/$TESTSUBJECT/versions.alt/orig/v$a/$TESTSUBJECT_ALT/build/src
  mkdir $experiment_root/$TESTSUBJECT/versions.alt/orig/v$a/$TESTSUBJECT_ALT/build/src/main
  mkdir $experiment_root/$TESTSUBJECT/versions.alt/orig/v$a/$TESTSUBJECT_ALT/build/src/testcases
  mkdir $experiment_root/$TESTSUBJECT/versions.alt/orig/v$a/$TESTSUBJECT_ALT/build/classes
  mkdir $experiment_root/$TESTSUBJECT/versions.alt/orig/v$a/$TESTSUBJECT_ALT/build/testcases
  ls $experiment_root/$TESTSUBJECT/versions.alt/orig/v$a/$TESTSUBJECT_ALT/build

  echo "copy src and classes to version.alt v$a directory"
  cp -r org.jacoco.core/src/* $experiment_root/$TESTSUBJECT/versions.alt/orig/v$a/$TESTSUBJECT_ALT/build/src/main
  cp -r org.jacoco.core/target/classes $experiment_root/$TESTSUBJECT/versions.alt/orig/v$a/$TESTSUBJECT_ALT/build
  cp -r org.jacoco.core.test/src/* $experiment_root/$TESTSUBJECT/versions.alt/orig/v$a/$TESTSUBJECT_ALT/build/src/testcases
  cp -r org.jacoco.core.test/target/classes/* $experiment_root/$TESTSUBJECT/versions.alt/orig/v$a/$TESTSUBJECT_ALT/build/testcases
  ls -R $experiment_root/$TESTSUBJECT/versions.alt/orig/v$a/$TESTSUBJECT_ALT/build/*

  let " a +=1 "
  cd ..
done