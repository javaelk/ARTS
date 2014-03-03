#!/bin/bash -x 
# The following is an R script type

MY_DIR=$(dirname $(readlink -f $0))
source $MY_DIR/scriptheader.sh

VER=v2
Test="\$Test"
EXCLUDEDCLASSES=""

echo " running test 1"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.algorithms.implementations.BlockEncryptionTest.test_3DES > $experiment_root/$TESTSUBJECT/outputs/t1 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.BlockEncryptionTest.test_3DES $VER

echo " running test 2"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.algorithms.implementations.BlockEncryptionTest.test_AES128 > $experiment_root/$TESTSUBJECT/outputs/t2 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.BlockEncryptionTest.test_AES128 $VER

echo " running test 3"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.algorithms.implementations.BlockEncryptionTest.test_AES192 > $experiment_root/$TESTSUBJECT/outputs/t3 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.BlockEncryptionTest.test_AES192 $VER

echo " running test 4"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.algorithms.implementations.BlockEncryptionTest.test_AES256 > $experiment_root/$TESTSUBJECT/outputs/t4 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.BlockEncryptionTest.test_AES256 $VER

echo " running test 5"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_3DES > $experiment_root/$TESTSUBJECT/outputs/t5 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_3DES $VER

echo " running test 6"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_41 > $experiment_root/$TESTSUBJECT/outputs/t6 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_41 $VER

echo " running test 7"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_42 > $experiment_root/$TESTSUBJECT/outputs/t7 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_42 $VER

echo " running test 8"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_43 > $experiment_root/$TESTSUBJECT/outputs/t8 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_43 $VER

echo " running test 9"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_44 > $experiment_root/$TESTSUBJECT/outputs/t9 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_44 $VER

echo " running test 10"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_45 > $experiment_root/$TESTSUBJECT/outputs/t10 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_45 $VER

echo " running test 11"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_46 > $experiment_root/$TESTSUBJECT/outputs/t11 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.algorithms.implementations.KeyWrapTest.test_AES_46 $VER

echo " running test 12"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.helper.C14nHelperTest.testNamespaceIsAbsolute01 > $experiment_root/$TESTSUBJECT/outputs/t12 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.helper.C14nHelperTest.testNamespaceIsAbsolute01 $VER

echo " running test 13"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.helper.C14nHelperTest.testNamespaceIsAbsolute02 > $experiment_root/$TESTSUBJECT/outputs/t13 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.helper.C14nHelperTest.testNamespaceIsAbsolute02 $VER

echo " running test 14"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.helper.C14nHelperTest.testNamespaceIsAbsolute03 > $experiment_root/$TESTSUBJECT/outputs/t14 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.helper.C14nHelperTest.testNamespaceIsAbsolute03 $VER

echo " running test 15"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.helper.C14nHelperTest.testNamespaceIsRelative01 > $experiment_root/$TESTSUBJECT/outputs/t15 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.helper.C14nHelperTest.testNamespaceIsRelative01 $VER

echo " running test 16"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.helper.C14nHelperTest.testNamespaceIsRelative02 > $experiment_root/$TESTSUBJECT/outputs/t16 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.helper.C14nHelperTest.testNamespaceIsRelative02 $VER

echo " running test 17"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest.test221 > $experiment_root/$TESTSUBJECT/outputs/t17 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest.test221 $VER

echo " running test 18"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest.test221excl > $experiment_root/$TESTSUBJECT/outputs/t18 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest.test221excl $VER

echo " running test 19"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest.test222 > $experiment_root/$TESTSUBJECT/outputs/t19 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest.test222 $VER

echo " running test 20"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest.test222excl > $experiment_root/$TESTSUBJECT/outputs/t20 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest.test222excl $VER

echo " running test 21"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest.testA > $experiment_root/$TESTSUBJECT/outputs/t21 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315ExclusiveTest.testA $VER

echo " running test 22"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test31subset > $experiment_root/$TESTSUBJECT/outputs/t22 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test31subset $VER

echo " running test 23"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test31subtree > $experiment_root/$TESTSUBJECT/outputs/t23 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test31subtree $VER

echo " running test 24"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test31withCommentsSubset > $experiment_root/$TESTSUBJECT/outputs/t24 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test31withCommentsSubset $VER

echo " running test 25"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test31withCommentsSubtree > $experiment_root/$TESTSUBJECT/outputs/t25 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test31withCommentsSubtree $VER

echo " running test 26"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test32subset > $experiment_root/$TESTSUBJECT/outputs/t26 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test32subset $VER

echo " running test 27"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test32subtree > $experiment_root/$TESTSUBJECT/outputs/t27 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test32subtree $VER

echo " running test 28"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test33subset > $experiment_root/$TESTSUBJECT/outputs/t28 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test33subset $VER

echo " running test 29"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test33subtree > $experiment_root/$TESTSUBJECT/outputs/t29 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test33subtree $VER

echo " running test 30"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test34subset > $experiment_root/$TESTSUBJECT/outputs/t30 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test34subset $VER

echo " running test 31"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test34subtree > $experiment_root/$TESTSUBJECT/outputs/t31 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test34subtree $VER

echo " running test 32"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test35subset > $experiment_root/$TESTSUBJECT/outputs/t32 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test35subset $VER

echo " running test 33"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test35subtree > $experiment_root/$TESTSUBJECT/outputs/t33 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test35subtree $VER

echo " running test 34"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test36subset > $experiment_root/$TESTSUBJECT/outputs/t34 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test36subset $VER

echo " running test 35"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test36subtree > $experiment_root/$TESTSUBJECT/outputs/t35 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test36subtree $VER

echo " running test 36"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test37 > $experiment_root/$TESTSUBJECT/outputs/t36 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test37 $VER

echo " running test 37"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test37byNodeList > $experiment_root/$TESTSUBJECT/outputs/t37 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.test37byNodeList $VER

echo " running test 38"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.testRelativeNSbehaviour > $experiment_root/$TESTSUBJECT/outputs/t38 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.testRelativeNSbehaviour $VER

echo " running test 39"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.testTranslationFromUTF16toUTF8 > $experiment_root/$TESTSUBJECT/outputs/t39 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.testTranslationFromUTF16toUTF8 $VER

echo " running test 40"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.testXMLAttributes1 > $experiment_root/$TESTSUBJECT/outputs/t40 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.testXMLAttributes1 $VER

echo " running test 41"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.testXMLAttributes2 > $experiment_root/$TESTSUBJECT/outputs/t41 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.testXMLAttributes2 $VER

echo " running test 42"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.testXMLAttributes3 > $experiment_root/$TESTSUBJECT/outputs/t42 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.Canonicalizer20010315Test.testXMLAttributes3 $VER

echo " running test 43"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.ExclusiveC14NInterop.test_Y1 > $experiment_root/$TESTSUBJECT/outputs/t43 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.ExclusiveC14NInterop.test_Y1 $VER

echo " running test 44"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.ExclusiveC14NInterop.test_Y2 > $experiment_root/$TESTSUBJECT/outputs/t44 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.ExclusiveC14NInterop.test_Y2 $VER

echo " running test 45"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.ExclusiveC14NInterop.test_Y3 > $experiment_root/$TESTSUBJECT/outputs/t45 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.ExclusiveC14NInterop.test_Y3 $VER

echo " running test 46"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.c14n.implementations.ExclusiveC14NInterop.test_Y4 > $experiment_root/$TESTSUBJECT/outputs/t46 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.c14n.implementations.ExclusiveC14NInterop.test_Y4 $VER

echo " running test 47"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.AttributeAncestorOrSelf.test01 > $experiment_root/$TESTSUBJECT/outputs/t47 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.AttributeAncestorOrSelf.test01 $VER

echo " running test 48"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.AttributeAncestorOrSelf.test02 > $experiment_root/$TESTSUBJECT/outputs/t48 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.AttributeAncestorOrSelf.test02 $VER

echo " running test 49"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.AttributeAncestorOrSelf.test03 > $experiment_root/$TESTSUBJECT/outputs/t49 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.AttributeAncestorOrSelf.test03 $VER

echo " running test 50"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testBad01 > $experiment_root/$TESTSUBJECT/outputs/t50 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testBad01 $VER

echo " running test 51"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testBad02 > $experiment_root/$TESTSUBJECT/outputs/t51 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testBad02 $VER

echo " running test 52"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testBad03 > $experiment_root/$TESTSUBJECT/outputs/t52 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testBad03 $VER

echo " running test 53"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testGood01 > $experiment_root/$TESTSUBJECT/outputs/t53 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testGood01 $VER

echo " running test 54"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testGood02 > $experiment_root/$TESTSUBJECT/outputs/t54 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testGood02 $VER

echo " running test 55"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testGood03 > $experiment_root/$TESTSUBJECT/outputs/t55 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testGood03 $VER

echo " running test 56"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testGood04 > $experiment_root/$TESTSUBJECT/outputs/t56 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testGood04 $VER

echo " running test 57"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testGood05 > $experiment_root/$TESTSUBJECT/outputs/t57 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.external.org.apache.xalan.XPathAPI.XalanBug1425Test.testGood05 $VER

echo " running test 58"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloped_dsa > $experiment_root/$TESTSUBJECT/outputs/t58 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloped_dsa $VER

echo " running test 59"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloping_b64_dsa > $experiment_root/$TESTSUBJECT/outputs/t59 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloping_b64_dsa $VER

echo " running test 60"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloping_dsa > $experiment_root/$TESTSUBJECT/outputs/t60 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloping_dsa $VER

echo " running test 61"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloping_hmac_sha1 > $experiment_root/$TESTSUBJECT/outputs/t61 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloping_hmac_sha1 $VER

echo " running test 62"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloping_hmac_sha1_40 > $experiment_root/$TESTSUBJECT/outputs/t62 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloping_hmac_sha1_40 $VER

echo " running test 63"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloping_rsa > $experiment_root/$TESTSUBJECT/outputs/t63 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_enveloping_rsa $VER

echo " running test 64"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_external_b64_dsa > $experiment_root/$TESTSUBJECT/outputs/t64 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_external_b64_dsa $VER

echo " running test 65"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_external_dsa > $experiment_root/$TESTSUBJECT/outputs/t65 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.BaltimoreTest.test_fifteen_external_dsa $VER

echo " running test 66"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.BaltimoreTest.test_sixteen_external_dsa > $experiment_root/$TESTSUBJECT/outputs/t66 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.BaltimoreTest.test_sixteen_external_dsa $VER

echo " running test 67"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_coreFeatures_signatures_anonymousReferenceSignature > $experiment_root/$TESTSUBJECT/outputs/t67 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_coreFeatures_signatures_anonymousReferenceSignature $VER

echo " running test 68"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_coreFeatures_signatures_manifestSignature_core > $experiment_root/$TESTSUBJECT/outputs/t68 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_coreFeatures_signatures_manifestSignature_core $VER

echo " running test 69"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_coreFeatures_signatures_manifestSignature_manifest > $experiment_root/$TESTSUBJECT/outputs/t69 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_coreFeatures_signatures_manifestSignature_manifest $VER

echo " running test 70"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_coreFeatures_signatures_signatureTypesSignature > $experiment_root/$TESTSUBJECT/outputs/t70 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_coreFeatures_signatures_signatureTypesSignature $VER

echo " running test 71"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_signatureAlgorithms_signatures_dSASignature > $experiment_root/$TESTSUBJECT/outputs/t71 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_signatureAlgorithms_signatures_dSASignature $VER

echo " running test 72"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_signatureAlgorithms_signatures_hMACShortSignature > $experiment_root/$TESTSUBJECT/outputs/t72 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_signatureAlgorithms_signatures_hMACShortSignature $VER

echo " running test 73"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_signatureAlgorithms_signatures_hMACSignature > $experiment_root/$TESTSUBJECT/outputs/t73 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_signatureAlgorithms_signatures_hMACSignature $VER

echo " running test 74"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_signatureAlgorithms_signatures_rSASignature > $experiment_root/$TESTSUBJECT/outputs/t74 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_signatureAlgorithms_signatures_rSASignature $VER

echo " running test 75"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_transforms_signatures_base64DecodeSignature > $experiment_root/$TESTSUBJECT/outputs/t75 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_transforms_signatures_base64DecodeSignature $VER

echo " running test 76"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_transforms_signatures_c14nSignature > $experiment_root/$TESTSUBJECT/outputs/t76 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_transforms_signatures_c14nSignature $VER

echo " running test 77"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_transforms_signatures_envelopedSignatureSignature > $experiment_root/$TESTSUBJECT/outputs/t77 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_transforms_signatures_envelopedSignatureSignature $VER

echo " running test 78"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.IAIKTest.test_transforms_signatures_xPathSignature > $experiment_root/$TESTSUBJECT/outputs/t78 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.IAIKTest.test_transforms_signatures_xPathSignature $VER

echo " running test 79"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.RSASecurityTest.test_enveloped > $experiment_root/$TESTSUBJECT/outputs/t79 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.RSASecurityTest.test_enveloped $VER

echo " running test 80"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.interop.RSASecurityTest.test_enveloping > $experiment_root/$TESTSUBJECT/outputs/t80 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.interop.RSASecurityTest.test_enveloping $VER

echo " running test 81"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.signature.XMLSignatureInputTest.testIsInitializedWithNodeSet > $experiment_root/$TESTSUBJECT/outputs/t81 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.signature.XMLSignatureInputTest.testIsInitializedWithNodeSet $VER

echo " running test 82"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.signature.XMLSignatureInputTest.testIsInitializedWithOctetStream > $experiment_root/$TESTSUBJECT/outputs/t82 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.signature.XMLSignatureInputTest.testIsInitializedWithOctetStream $VER

echo " running test 83"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.signature.XMLSignatureInputTest.testNodeSetIsNodeSet > $experiment_root/$TESTSUBJECT/outputs/t83 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.signature.XMLSignatureInputTest.testNodeSetIsNodeSet $VER

echo " running test 84"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.signature.XMLSignatureInputTest.testNodeSetIsNotOctetStream > $experiment_root/$TESTSUBJECT/outputs/t84 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.signature.XMLSignatureInputTest.testNodeSetIsNotOctetStream $VER

echo " running test 85"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.signature.XMLSignatureInputTest.testOctetStreamIsNotNodeSet > $experiment_root/$TESTSUBJECT/outputs/t85 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.signature.XMLSignatureInputTest.testOctetStreamIsNotNodeSet $VER

echo " running test 86"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.signature.XMLSignatureInputTest.testOctetStreamIsOctetStream > $experiment_root/$TESTSUBJECT/outputs/t86 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.signature.XMLSignatureInputTest.testOctetStreamIsOctetStream $VER

echo " running test 87"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.signature.XMLSignatureInputTest.testSetNodeSetGetOctetStream1 > $experiment_root/$TESTSUBJECT/outputs/t87 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.signature.XMLSignatureInputTest.testSetNodeSetGetOctetStream1 $VER

echo " running test 88"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.signature.XMLSignatureInputTest.testSetOctetStreamGetOctetStream > $experiment_root/$TESTSUBJECT/outputs/t88 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.signature.XMLSignatureInputTest.testSetOctetStreamGetOctetStream $VER

echo " running test 89"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.transforms.implementations.TransformBase64DecodeTest.test1 > $experiment_root/$TESTSUBJECT/outputs/t89 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.transforms.implementations.TransformBase64DecodeTest.test1 $VER

echo " running test 90"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.transforms.implementations.TransformBase64DecodeTest.test2 > $experiment_root/$TESTSUBJECT/outputs/t90 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.transforms.implementations.TransformBase64DecodeTest.test2 $VER

echo " running test 91"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.transforms.implementations.TransformBase64DecodeTest.test3 > $experiment_root/$TESTSUBJECT/outputs/t91 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.transforms.implementations.TransformBase64DecodeTest.test3 $VER

echo " running test 92"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.utils.Base64Test.testA1 > $experiment_root/$TESTSUBJECT/outputs/t92 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.utils.Base64Test.testA1 $VER

echo " running test 93"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.utils.resolver.ResourceResolverSpiTest.testExpandSystemId_1 > $experiment_root/$TESTSUBJECT/outputs/t93 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.utils.resolver.ResourceResolverSpiTest.testExpandSystemId_1 $VER

echo " running test 94"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES AllTestAdapter org.apache.xml.security.test.utils.resolver.ResourceResolverSpiTest.testExpandSystemId_2 > $experiment_root/$TESTSUBJECT/outputs/t94 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.xml.security.test.utils.resolver.ResourceResolverSpiTest.testExpandSystemId_2 $VER
