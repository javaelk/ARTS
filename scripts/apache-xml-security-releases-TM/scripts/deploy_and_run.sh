#!/bin/bash -x
echo "this script deploys,builds,beautifies, instruments and collects trace, output is a set of trace output files from emma" 

MY_DIR=$(dirname $(readlink -f $0))
source $MY_DIR/header.sh

java1_5=$HOME/java/jdk1.5.0_22
java1_6=$HOME/java/jdk1.6.0_45
java1_7=$HOME/java/jdk1.7.0_51
ant1_8_2=$HOME/java/apache-ant-1.8.2
ant1_7_1=$HOME/java/apache-ant-1.7.1
ant1_7_0=$HOME/java/apache-ant-1.7.0

export CLASSPATH=.
export JAVA_HOME=$java1_5
export ANT_HOME=$ant1_7_0
export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH

cd ${experiment_root}

echo "1) deploy ,this will copy from version.alt directory to source"
tar xvf xml-security_1.4.tar.gz

for VER in {0..3}
do

cd $SVNLOCAL/scripts
./install.sh orig $VER

echo "2) beautify orig version v$VER .."
$HOME/java/Jindent/Jindent -J-Xms256M -J-Xmx256M -r -p $HOME/java/Jindent/RTS.xjs $SVNLOCAL/source/$TESTSUBJECT_ALT/src/*.java >/dev/null 2>&1
#remove all blank lines from src code
$experiment_root/workspace/pretty/removeBlankLines.sh $SVNLOCAL/source/$TESTSUBJECT_ALT/src/

cd $SVNLOCAL/source/$TESTSUBJECT_ALT
echo "3) build, this will create class files in source/build directory"
echo "modify bulid.xml file to change debug level"
echo "debug=\"true\" debuglevel=\"lines,vars,source\""

if [ -f build.xml ]
 then
    sed -i 's/<javac srcdir="${build.src}" destdir="${build.classes}">/<javac srcdir="${build.src}" destdir="${build.classes}" sourcepath="${build.src}" debug="true" debuglevel="lines,vars,source">/' build.xml
 sed -i 's/<javac srcdir="${dir.src.unitTests}" destdir="${build.classes}">/<javac srcdir="${dir.src.unitTests}" destdir="${build.tests}">/' build.xml
 sed -i 's/<javac srcdir="${dir.src.samples}"/<javac srcdir="${dir.src.samples}" destdir="${build.samples}">/' build.xml
 sed -i 's/destdir="${build.classes}">//' build.xml
 sed -i 's~<mkdir dir="${build.classes}" \/>~<mkdir dir="${build.classes}" \/><mkdir dir="${build.tests}" \/><mkdir dir="${build.samples}" \/>~' build.xml
fi

cp ${experiment_root}/$TESTSUBJECT/common/* $SVNLOCAL/source/$TESTSUBJECT_ALT/src_unitTests
echo "./build.sh $VER"
echo "this will create a new build directory under source/xml-security"
echo "in the build dir, there is a classes folder and a src folder."

$SVNLOCAL/scripts/build.sh $VER

echo "4) copy build results (class files and beautified source files) back to version.alt directory - this is un-instrumented version class files"
  mkdir -p $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/src
  mkdir -p $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/classes

  echo "copy src and classes to version.alt v$VER directory"
  cp -r $SVNLOCAL/source/xml-security/build/classes/* $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/classes
  cp -r $SVNLOCAL/source/xml-security/build/src/* $experiment_root/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/src

echo "5) run tests with trace.."
echo "clean up traces folder first.."
rm -rf $SVNLOCAL/traces/*
${experiment_root}/$TESTSUBJECT/scripts/TestScripts/scriptR${VER}coverage.cls >${experiment_root}/$TESTSUBJECT/outputs/v$VER.log 2>&1
mkdir ${experiment_root}/$TESTSUBJECT/outputs/v$VER
mv ${experiment_root}/$TESTSUBJECT/outputs/t* ${experiment_root}/$TESTSUBJECT/outputs/v$VER
echo "please verify trace results are linked to source files"

rm -rf $SVNLOCAL/source/*
done

