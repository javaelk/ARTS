#!/bin/bash -xv
TESTSUBJECT="jacoco-core-snapshots-TC"
TESTSUBJECT_ALT="jacoco_core"
GITNAME="jacoco_snapshots"
#number of versions is fixed based on number of snapshot builds' hash values provided in the for ver in..." 
LAST_VERSION=8

echo " this script fetches source from github, build and deploy to sir verions.alt directory"
echo "fetch from github" 
cd $HOME/git
mkdir $GITNAME
cd $GITNAME
git init
git clone https://github.com/jacoco/jacoco.git
cd jacoco
ls

echo "archive "

b=$LAST_VERSION
for VER in fc340a20c201bec9c0ee31ec16c85766477a1edf 1b1935e739a09eb467c86036b480f513cd8bef4a  57f7cf06888f1e34f9ab2e3129c3d433826ecbe1 6396bb4769d9c044d38cebb126a81fc6cded8e01  e10fc8bd732eec8fadeceee249ca927518fe5d47 8c614bab37eee9dbf920a7b20a2b18ab1b8c20d4 b71f404f18be740ea9290e1b3d7102e5646d63f7 5f6f478cac07ce83341b889997804e52339245b6 9e9cfaac707f36f013a10a4dd089f742a9aa149b 
do 
 echo "archive version $b"
 git archive --format=tar.gz $VER > jacoco-v$b.tar.gz
 let " b -=1 "
done
ls

echo "deploy "
cd $experiment_root
mkdir $GITNAME
cd $GITNAME

#need to manually change number of versions here, variable won't work
for VER in {0..8..1}
do
  echo "untar $VER and build" 
  mkdir v$VER
  cd v$VER
  tar xvzf $HOME/git/$GITNAME/jacoco/jacoco-v$VER.tar.gz

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

  echo "create & clean up build directory v$VER before copy" 
  mkdir -p $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/src
  mkdir -p $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/src/main
  mkdir -p $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/src/testcases
  mkdir -p $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/classes
  mkdir -p $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/testcases
  ls $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build

  echo "copy src and classes to version.alt v$VER directory"
  cp -r org.jacoco.core/src/* $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/src/main
  cp -r org.jacoco.core/target/classes $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build
  cp -r org.jacoco.core.test/src/* $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/src/testcases
  cp -r org.jacoco.core.test/target/classes/* $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/testcases
  ls -R $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/*

  cd ..
done
