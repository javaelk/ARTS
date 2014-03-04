#!/bin/bash -x 
# The following is an R script type

MY_DIR=$(dirname $(readlink -f $0))
source $MY_DIR/scriptheader.sh

VER=v1
Test="\$Test"
EXCLUDEDCLASSES=""

export CLASSPATH
echo ">>>>>>>>running test 1"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.c14n.helper.C14nHelperTest  > $experiment_root/$TESTSUBJECT/outputs/t1 2>&1


$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.helper.C14nHelperTest $VER

echo ">>>>>>>>running test 2"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test  > $experiment_root/$TESTSUBJECT/outputs/t2 2>&1


$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test $VER

echo ">>>>>>>>running test 3"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest  > $experiment_root/$TESTSUBJECT/outputs/t3 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest $VER

echo ">>>>>>>>running test 4"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test  > $experiment_root/$TESTSUBJECT/outputs/t4 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test $VER

echo ">>>>>>>>running test 5"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.AttributeAncestorOrSelf  > $experiment_root/$TESTSUBJECT/outputs/t5 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.AttributeAncestorOrSelf $VER

echo ">>>>>>>>running test 6"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.signature.XMLSignatureInputTest  > $experiment_root/$TESTSUBJECT/outputs/t6 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.signature.XMLSignatureInputTest $VER

echo ">>>>>>>>running test 7"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.transforms.implementations.TransformBase64DecodeTest  > $experiment_root/$TESTSUBJECT/outputs/t7 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.transforms.implementations.TransformBase64DecodeTest $VER

echo ">>>>>>>>running test 8"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.utils.resolver.ResourceResolverSpiTest  > $experiment_root/$TESTSUBJECT/outputs/t8 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.utils.resolver.ResourceResolverSpiTest $VER

echo ">>>>>>>>running test 9"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.utils.Base64Test  > $experiment_root/$TESTSUBJECT/outputs/t9 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.utils.Base64Test $VER

echo ">>>>>>>>running test 10"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.algorithms.implementations.KeyWrapTest  > $experiment_root/$TESTSUBJECT/outputs/t10 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.KeyWrapTest $VER

echo ">>>>>>>>running test 11"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.algorithms.implementations.BlockEncryptionTest  > $experiment_root/$TESTSUBJECT/outputs/t11 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.BlockEncryptionTest $VER

echo ">>>>>>>>running test 12"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.interop.BaltimoreTest  > $experiment_root/$TESTSUBJECT/outputs/t12 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.BaltimoreTest $VER

echo ">>>>>>>>running test 13"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.interop.IAIKTest  > $experiment_root/$TESTSUBJECT/outputs/t13 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest $VER

echo ">>>>>>>>running test 14"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.interop.RSASecurityTest  > $experiment_root/$TESTSUBJECT/outputs/t14 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.RSASecurityTest $VER

echo ">>>>>>>>running test 15"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES junit.textui.TestRunner org.apache.xml.security.test.c14n.implementations.ExclusiveC14NInterop  > $experiment_root/$TESTSUBJECT/outputs/t15 2>&1

$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.ExclusiveC14NInterop $VER
