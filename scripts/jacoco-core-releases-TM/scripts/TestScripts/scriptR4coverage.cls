#!/bin/sh -x
TESTSUBJECT="jacoco-core-releases-TM"
TESTSUBJECT_ALT="jacoco_core"
VER=v4
EXCLUDEDCLASSES="org.jacoco.core.test.validation.targets.*:*Test\$*"
#EXCLUDEDCLASSES="org.jacoco.core.test.validation.targets.*:org.jacoco.core.instr.InstrumenterTest\$SerializationTarget"

unset CLASSPATH
CLASSPATH=".:$experiment_root/$TESTSUBJECT/scripts/TestScripts:$experiment_root/$TESTSUBJECT/versions.alt/orig/$VER/$TESTSUBJECT_ALT/build/classes:$experiment_root/$TESTSUBJECT/versions.alt/orig/$VER/$TESTSUBJECT_ALT/build/testcases:$experiment_root/$TESTSUBJECT/versions.alt/orig/$VER/$TESTSUBJECT_ALT/lib/*"
export CLASSPATH

echo " running test 1"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.JaCoCoTest.testHOMEURL> $experiment_root/$TESTSUBJECT/outputs/t1 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.JaCoCoTest.testHOMEURL $VER

echo " running test 2"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.JaCoCoTest.testVERSION> $experiment_root/$TESTSUBJECT/outputs/t2 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.JaCoCoTest.testVERSION $VER

echo " running test 3"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testCollectEmpty> $experiment_root/$TESTSUBJECT/outputs/t3 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testCollectEmpty $VER

echo " running test 4"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testGetSetSessionId> $experiment_root/$TESTSUBJECT/outputs/t4 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testGetSetSessionId $VER

echo " running test 5"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testExecutionRecording> $experiment_root/$TESTSUBJECT/outputs/t5 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testExecutionRecording $VER

echo " running test 6"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testLoadSameClassTwice> $experiment_root/$TESTSUBJECT/outputs/t6 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testLoadSameClassTwice $VER

echo " running test 7"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testDataAccessor> $experiment_root/$TESTSUBJECT/outputs/t7 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testDataAccessor $VER

echo " running test 8"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testReset> $experiment_root/$TESTSUBJECT/outputs/t8 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testReset $VER

echo " running test 9"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testCollectAndReset> $experiment_root/$TESTSUBJECT/outputs/t9 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testCollectAndReset $VER

echo " running test 10"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testSessionInfo> $experiment_root/$TESTSUBJECT/outputs/t10 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testSessionInfo $VER

echo " running test 11"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testNoLocalVariablesInDataAccessor> $experiment_root/$TESTSUBJECT/outputs/t11 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.SystemPropertiesRuntimeTest.testNoLocalVariablesInDataAccessor $VER

echo " running test 12"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.LoggerRuntimeTest.testCollectEmpty> $experiment_root/$TESTSUBJECT/outputs/t12 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.LoggerRuntimeTest.testCollectEmpty $VER

echo " running test 13"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.LoggerRuntimeTest.testGetSetSessionId> $experiment_root/$TESTSUBJECT/outputs/t13 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.LoggerRuntimeTest.testGetSetSessionId $VER

echo " running test 14"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.LoggerRuntimeTest.testExecutionRecording> $experiment_root/$TESTSUBJECT/outputs/t14 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.LoggerRuntimeTest.testExecutionRecording $VER

echo " running test 15"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.LoggerRuntimeTest.testLoadSameClassTwice> $experiment_root/$TESTSUBJECT/outputs/t15 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.LoggerRuntimeTest.testLoadSameClassTwice $VER

echo " running test 16"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.LoggerRuntimeTest.testDataAccessor> $experiment_root/$TESTSUBJECT/outputs/t16 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.LoggerRuntimeTest.testDataAccessor $VER

echo " running test 17"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.LoggerRuntimeTest.testReset> $experiment_root/$TESTSUBJECT/outputs/t17 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.LoggerRuntimeTest.testReset $VER

echo " running test 18"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.LoggerRuntimeTest.testCollectAndReset> $experiment_root/$TESTSUBJECT/outputs/t18 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.LoggerRuntimeTest.testCollectAndReset $VER

echo " running test 19"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.LoggerRuntimeTest.testSessionInfo> $experiment_root/$TESTSUBJECT/outputs/t19 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.LoggerRuntimeTest.testSessionInfo $VER

echo " running test 20"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.LoggerRuntimeTest.testNoLocalVariablesInDataAccessor> $experiment_root/$TESTSUBJECT/outputs/t20 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.LoggerRuntimeTest.testNoLocalVariablesInDataAccessor $VER

echo " running test 21"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testCollectEmpty> $experiment_root/$TESTSUBJECT/outputs/t21 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testCollectEmpty $VER

echo " running test 22"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testGetSetSessionId> $experiment_root/$TESTSUBJECT/outputs/t22 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testGetSetSessionId $VER

echo " running test 23"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testExecutionRecording> $experiment_root/$TESTSUBJECT/outputs/t23 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testExecutionRecording $VER

echo " running test 24"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testLoadSameClassTwice> $experiment_root/$TESTSUBJECT/outputs/t24 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testLoadSameClassTwice $VER

echo " running test 25"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testDataAccessor> $experiment_root/$TESTSUBJECT/outputs/t25 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testDataAccessor $VER

echo " running test 26"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testReset> $experiment_root/$TESTSUBJECT/outputs/t26 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testReset $VER

echo " running test 27"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testCollectAndReset> $experiment_root/$TESTSUBJECT/outputs/t27 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testCollectAndReset $VER

echo " running test 28"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testSessionInfo> $experiment_root/$TESTSUBJECT/outputs/t28 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testSessionInfo $VER

echo " running test 29"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testNoLocalVariablesInDataAccessor> $experiment_root/$TESTSUBJECT/outputs/t29 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.URLStreamHandlerRuntimeTest.testNoLocalVariablesInDataAccessor $VER

echo " running test 30"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testDefaults> $experiment_root/$TESTSUBJECT/outputs/t30 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testDefaults $VER

echo " running test 31"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testEmptyOptions> $experiment_root/$TESTSUBJECT/outputs/t31 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testEmptyOptions $VER

echo " running test 32"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testNullOptions> $experiment_root/$TESTSUBJECT/outputs/t32 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testNullOptions $VER

echo " running test 33"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testGetDestile> $experiment_root/$TESTSUBJECT/outputs/t33 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testGetDestile $VER

echo " running test 34"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetDestile> $experiment_root/$TESTSUBJECT/outputs/t34 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetDestile $VER

echo " running test 35"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testGetAppendTrue> $experiment_root/$TESTSUBJECT/outputs/t35 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testGetAppendTrue $VER

echo " running test 36"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testGetAppendFalse> $experiment_root/$TESTSUBJECT/outputs/t36 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testGetAppendFalse $VER

echo " running test 37"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetAppendTrue> $experiment_root/$TESTSUBJECT/outputs/t37 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetAppendTrue $VER

echo " running test 38"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetAppendFalse> $experiment_root/$TESTSUBJECT/outputs/t38 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetAppendFalse $VER

echo " running test 39"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testGetExclClassloader> $experiment_root/$TESTSUBJECT/outputs/t39 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testGetExclClassloader $VER

echo " running test 40"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetExclClassloader> $experiment_root/$TESTSUBJECT/outputs/t40 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetExclClassloader $VER

echo " running test 41"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testGetIncludes> $experiment_root/$TESTSUBJECT/outputs/t41 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testGetIncludes $VER

echo " running test 42"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetIncludes> $experiment_root/$TESTSUBJECT/outputs/t42 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetIncludes $VER

echo " running test 43"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testGetExcludes> $experiment_root/$TESTSUBJECT/outputs/t43 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testGetExcludes $VER

echo " running test 44"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetExcludes> $experiment_root/$TESTSUBJECT/outputs/t44 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetExcludes $VER

echo " running test 45"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testGetSessionId> $experiment_root/$TESTSUBJECT/outputs/t45 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testGetSessionId $VER

echo " running test 46"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetSessionId> $experiment_root/$TESTSUBJECT/outputs/t46 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetSessionId $VER

echo " running test 47"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testGetDumpOnExit> $experiment_root/$TESTSUBJECT/outputs/t47 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testGetDumpOnExit $VER

echo " running test 48"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetDumpOnExit> $experiment_root/$TESTSUBJECT/outputs/t48 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetDumpOnExit $VER

echo " running test 49"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testGetOutput> $experiment_root/$TESTSUBJECT/outputs/t49 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testGetOutput $VER

echo " running test 50"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetOutput1> $experiment_root/$TESTSUBJECT/outputs/t50 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetOutput1 $VER

echo " running test 51"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetOutput2> $experiment_root/$TESTSUBJECT/outputs/t51 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetOutput2 $VER

echo " running test 52"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testInvalidOutput1> $experiment_root/$TESTSUBJECT/outputs/t52 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testInvalidOutput1 $VER

echo " running test 53"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testInvalidOutput2> $experiment_root/$TESTSUBJECT/outputs/t53 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testInvalidOutput2 $VER

echo " running test 54"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testGetPort> $experiment_root/$TESTSUBJECT/outputs/t54 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testGetPort $VER

echo " running test 55"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetPort> $experiment_root/$TESTSUBJECT/outputs/t55 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetPort $VER

echo " running test 56"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testParseInvalidPort> $experiment_root/$TESTSUBJECT/outputs/t56 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testParseInvalidPort $VER

echo " running test 57"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetNegativePort> $experiment_root/$TESTSUBJECT/outputs/t57 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetNegativePort $VER

echo " running test 58"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testGetAddress> $experiment_root/$TESTSUBJECT/outputs/t58 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testGetAddress $VER

echo " running test 59"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testSetAddress> $experiment_root/$TESTSUBJECT/outputs/t59 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testSetAddress $VER

echo " running test 60"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testToString> $experiment_root/$TESTSUBJECT/outputs/t60 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testToString $VER

echo " running test 61"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testInvalidOptionFormat> $experiment_root/$TESTSUBJECT/outputs/t61 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testInvalidOptionFormat $VER

echo " running test 62"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testInvalidOptionKey> $experiment_root/$TESTSUBJECT/outputs/t62 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testInvalidOptionKey $VER

echo " running test 63"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testInvalidOptionValue> $experiment_root/$TESTSUBJECT/outputs/t63 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testInvalidOptionValue $VER

echo " running test 64"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testInvalidPortOptionValue> $experiment_root/$TESTSUBJECT/outputs/t64 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testInvalidPortOptionValue $VER

echo " running test 65"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testVMArgsWithNoOptions> $experiment_root/$TESTSUBJECT/outputs/t65 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testVMArgsWithNoOptions $VER

echo " running test 66"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testVMArgsWithOneOption> $experiment_root/$TESTSUBJECT/outputs/t66 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testVMArgsWithOneOption $VER

echo " running test 67"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.AgentOptionsTest.testVMArgsWithOptions> $experiment_root/$TESTSUBJECT/outputs/t67 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest.testVMArgsWithOptions $VER

echo " running test 68"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testSendCmdOk> $experiment_root/$TESTSUBJECT/outputs/t68 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testSendCmdOk $VER

echo " running test 69"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testNoRemoteCommandVisitor> $experiment_root/$TESTSUBJECT/outputs/t69 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testNoRemoteCommandVisitor $VER

echo " running test 70"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testVisitDump1> $experiment_root/$TESTSUBJECT/outputs/t70 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testVisitDump1 $VER

echo " running test 71"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testVisitDump2> $experiment_root/$TESTSUBJECT/outputs/t71 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testVisitDump2 $VER

echo " running test 72"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testVisitDump3> $experiment_root/$TESTSUBJECT/outputs/t72 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testVisitDump3 $VER

echo " running test 73"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testVisitDump4> $experiment_root/$TESTSUBJECT/outputs/t73 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testVisitDump4 $VER

echo " running test 74"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testSessionInfo> $experiment_root/$TESTSUBJECT/outputs/t74 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testSessionInfo $VER

echo " running test 75"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testEmpty> $experiment_root/$TESTSUBJECT/outputs/t75 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testEmpty $VER

echo " running test 76"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testFlush> $experiment_root/$TESTSUBJECT/outputs/t76 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testFlush $VER

echo " running test 77"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testCustomBlocks> $experiment_root/$TESTSUBJECT/outputs/t77 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testCustomBlocks $VER

echo " running test 78"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testGetFileHeader> $experiment_root/$TESTSUBJECT/outputs/t78 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testGetFileHeader $VER

echo " running test 79"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testMultipleHeaders> $experiment_root/$TESTSUBJECT/outputs/t79 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testMultipleHeaders $VER

echo " running test 80"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testInvalidMagicNumber> $experiment_root/$TESTSUBJECT/outputs/t80 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testInvalidMagicNumber $VER

echo " running test 81"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testInvalidHeaderVersion> $experiment_root/$TESTSUBJECT/outputs/t81 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testInvalidHeaderVersion $VER

echo " running test 82"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testMissingHeader> $experiment_root/$TESTSUBJECT/outputs/t82 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testMissingHeader $VER

echo " running test 83"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testUnknownBlock> $experiment_root/$TESTSUBJECT/outputs/t83 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testUnknownBlock $VER

echo " running test 84"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testEmptyFile> $experiment_root/$TESTSUBJECT/outputs/t84 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testEmptyFile $VER

echo " running test 85"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testNoSessionInfoVisitor> $experiment_root/$TESTSUBJECT/outputs/t85 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testNoSessionInfoVisitor $VER

echo " running test 86"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testSessionInfoIOException> $experiment_root/$TESTSUBJECT/outputs/t86 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testSessionInfoIOException $VER

echo " running test 87"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testNoExecutionDataVisitor> $experiment_root/$TESTSUBJECT/outputs/t87 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testNoExecutionDataVisitor $VER

echo " running test 88"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testMinClassId> $experiment_root/$TESTSUBJECT/outputs/t88 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testMinClassId $VER

echo " running test 89"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testMaxClassId> $experiment_root/$TESTSUBJECT/outputs/t89 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testMaxClassId $VER

echo " running test 90"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testEmptyClass> $experiment_root/$TESTSUBJECT/outputs/t90 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testEmptyClass $VER

echo " running test 91"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testOneClass> $experiment_root/$TESTSUBJECT/outputs/t91 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testOneClass $VER

echo " running test 92"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testTwoClasses> $experiment_root/$TESTSUBJECT/outputs/t92 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testTwoClasses $VER

echo " running test 93"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testBigClass> $experiment_root/$TESTSUBJECT/outputs/t93 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testBigClass $VER

echo " running test 94"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.RemoteControlReaderWriterTest.testExecutionDataIOException> $experiment_root/$TESTSUBJECT/outputs/t94 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest.testExecutionDataIOException $VER

echo " running test 95"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ExecutionDataAccessTest.testGenerateArgumentArray> $experiment_root/$TESTSUBJECT/outputs/t95 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ExecutionDataAccessTest.testGenerateArgumentArray $VER

echo " running test 96"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ExecutionDataAccessTest.testGenerateAccessCall> $experiment_root/$TESTSUBJECT/outputs/t96 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ExecutionDataAccessTest.testGenerateAccessCall $VER

echo " running test 97"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ExecutionDataAccessTest.testGetExecutionData1> $experiment_root/$TESTSUBJECT/outputs/t97 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ExecutionDataAccessTest.testGetExecutionData1 $VER

echo " running test 98"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testCreateForNegative> $experiment_root/$TESTSUBJECT/outputs/t98 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testCreateForNegative $VER

echo " running test 99"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testCollectEmpty> $experiment_root/$TESTSUBJECT/outputs/t99 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testCollectEmpty $VER

echo " running test 100"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testGetSetSessionId> $experiment_root/$TESTSUBJECT/outputs/t100 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testGetSetSessionId $VER

echo " running test 101"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testExecutionRecording> $experiment_root/$TESTSUBJECT/outputs/t101 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testExecutionRecording $VER

echo " running test 102"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testLoadSameClassTwice> $experiment_root/$TESTSUBJECT/outputs/t102 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testLoadSameClassTwice $VER

echo " running test 103"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testDataAccessor> $experiment_root/$TESTSUBJECT/outputs/t103 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testDataAccessor $VER

echo " running test 104"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testReset> $experiment_root/$TESTSUBJECT/outputs/t104 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testReset $VER

echo " running test 105"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testCollectAndReset> $experiment_root/$TESTSUBJECT/outputs/t105 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testCollectAndReset $VER

echo " running test 106"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testSessionInfo> $experiment_root/$TESTSUBJECT/outputs/t106 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testSessionInfo $VER

echo " running test 107"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testNoLocalVariablesInDataAccessor> $experiment_root/$TESTSUBJECT/outputs/t107 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest.testNoLocalVariablesInDataAccessor $VER

echo " running test 108"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.WildcardMatcherTest.testEmpty> $experiment_root/$TESTSUBJECT/outputs/t108 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.WildcardMatcherTest.testEmpty $VER

echo " running test 109"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.WildcardMatcherTest.testCaseSensitive> $experiment_root/$TESTSUBJECT/outputs/t109 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.WildcardMatcherTest.testCaseSensitive $VER

echo " running test 110"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.WildcardMatcherTest.testWildcards> $experiment_root/$TESTSUBJECT/outputs/t110 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.WildcardMatcherTest.testWildcards $VER

echo " running test 111"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.WildcardMatcherTest.testQuote> $experiment_root/$TESTSUBJECT/outputs/t111 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.WildcardMatcherTest.testQuote $VER

echo " running test 112"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.WildcardMatcherTest.testExact> $experiment_root/$TESTSUBJECT/outputs/t112 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.WildcardMatcherTest.testExact $VER

echo " running test 113"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.runtime.WildcardMatcherTest.testMultiExpression> $experiment_root/$TESTSUBJECT/outputs/t113 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.WildcardMatcherTest.testMultiExpression $VER

echo " running test 114"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.AnalyzerTest.testAnalyzeClass1> $experiment_root/$TESTSUBJECT/outputs/t114 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.AnalyzerTest.testAnalyzeClass1 $VER

echo " running test 115"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.AnalyzerTest.testAnalyzeClass2> $experiment_root/$TESTSUBJECT/outputs/t115 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.AnalyzerTest.testAnalyzeClass2 $VER

echo " running test 116"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.AnalyzerTest.testAnalyzeArchive> $experiment_root/$TESTSUBJECT/outputs/t116 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.AnalyzerTest.testAnalyzeArchive $VER

echo " running test 117"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.AnalyzerTest.testAnalyzeAll1> $experiment_root/$TESTSUBJECT/outputs/t117 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.AnalyzerTest.testAnalyzeAll1 $VER

echo " running test 118"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.AnalyzerTest.testAnalyzeAll2> $experiment_root/$TESTSUBJECT/outputs/t118 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.AnalyzerTest.testAnalyzeAll2 $VER

echo " running test 119"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.AnalyzerTest.testAnalyzeAll3> $experiment_root/$TESTSUBJECT/outputs/t119 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.AnalyzerTest.testAnalyzeAll3 $VER

echo " running test 120"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CounterComparatorTest.testTotalItemsComparator> $experiment_root/$TESTSUBJECT/outputs/t120 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CounterComparatorTest.testTotalItemsComparator $VER

echo " running test 121"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CounterComparatorTest.testCoveredItemsComparator> $experiment_root/$TESTSUBJECT/outputs/t121 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CounterComparatorTest.testCoveredItemsComparator $VER

echo " running test 122"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CounterComparatorTest.testMissedItemsComparator> $experiment_root/$TESTSUBJECT/outputs/t122 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CounterComparatorTest.testMissedItemsComparator $VER

echo " running test 123"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CounterComparatorTest.testCoveredRatioComparator> $experiment_root/$TESTSUBJECT/outputs/t123 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CounterComparatorTest.testCoveredRatioComparator $VER

echo " running test 124"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CounterComparatorTest.testMissedRatioComparator> $experiment_root/$TESTSUBJECT/outputs/t124 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CounterComparatorTest.testMissedRatioComparator $VER

echo " running test 125"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CounterComparatorTest.testReverseComparator> $experiment_root/$TESTSUBJECT/outputs/t125 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CounterComparatorTest.testReverseComparator $VER

echo " running test 126"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CounterComparatorTest.testNodeComparator1> $experiment_root/$TESTSUBJECT/outputs/t126 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CounterComparatorTest.testNodeComparator1 $VER

echo " running test 127"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CounterComparatorTest.testNodeComparator2> $experiment_root/$TESTSUBJECT/outputs/t127 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CounterComparatorTest.testNodeComparator2 $VER

echo " running test 128"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageBuilderTest.testCreateClassMissed> $experiment_root/$TESTSUBJECT/outputs/t128 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageBuilderTest.testCreateClassMissed $VER

echo " running test 129"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageBuilderTest.testCreateClassCovered> $experiment_root/$TESTSUBJECT/outputs/t129 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageBuilderTest.testCreateClassCovered $VER

echo " running test 130"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageBuilderTest.testIgnoreClassesWithoutCode> $experiment_root/$TESTSUBJECT/outputs/t130 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageBuilderTest.testIgnoreClassesWithoutCode $VER

echo " running test 131"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageBuilderTest.testDuplicateClassNameDifferent> $experiment_root/$TESTSUBJECT/outputs/t131 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageBuilderTest.testDuplicateClassNameDifferent $VER

echo " running test 132"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageBuilderTest.testDuplicateClassNameIdentical> $experiment_root/$TESTSUBJECT/outputs/t132 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageBuilderTest.testDuplicateClassNameIdentical $VER

echo " running test 133"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageBuilderTest.testCreateSourceFile> $experiment_root/$TESTSUBJECT/outputs/t133 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageBuilderTest.testCreateSourceFile $VER

echo " running test 134"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageBuilderTest.testGetBundle> $experiment_root/$TESTSUBJECT/outputs/t134 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageBuilderTest.testGetBundle $VER

echo " running test 135"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.NodeComparatorTest.testSort> $experiment_root/$TESTSUBJECT/outputs/t135 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.NodeComparatorTest.testSort $VER

echo " running test 136"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.NodeComparatorTest.testSecond1> $experiment_root/$TESTSUBJECT/outputs/t136 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.NodeComparatorTest.testSecond1 $VER

echo " running test 137"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.NodeComparatorTest.testSecond2> $experiment_root/$TESTSUBJECT/outputs/t137 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.NodeComparatorTest.testSecond2 $VER

echo " running test 138"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageNodeImplTest.testToString> $experiment_root/$TESTSUBJECT/outputs/t138 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageNodeImplTest.testToString $VER

echo " running test 139"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageNodeImplTest.testInit> $experiment_root/$TESTSUBJECT/outputs/t139 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageNodeImplTest.testInit $VER

echo " running test 140"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageNodeImplTest.testIncrement> $experiment_root/$TESTSUBJECT/outputs/t140 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageNodeImplTest.testIncrement $VER

echo " running test 141"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageNodeImplTest.testIncrementCollection> $experiment_root/$TESTSUBJECT/outputs/t141 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageNodeImplTest.testIncrementCollection $VER

echo " running test 142"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageNodeImplTest.testGetPlainCopy> $experiment_root/$TESTSUBJECT/outputs/t142 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageNodeImplTest.testGetPlainCopy $VER

echo " running test 143"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.analysis.CoverageNodeImplTest.testProperties> $experiment_root/$TESTSUBJECT/outputs/t143 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageNodeImplTest.testProperties $VER

echo " running test 144"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.ExceptionsTest.testCoverageResult> $experiment_root/$TESTSUBJECT/outputs/t144 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.ExceptionsTest.testCoverageResult $VER

echo " running test 145"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.FieldInitializationInTwoConstructorsTest.testCoverageResult> $experiment_root/$TESTSUBJECT/outputs/t145 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.FieldInitializationInTwoConstructorsTest.testCoverageResult $VER

echo " running test 146"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.ClassInitializerTest.testCoverageResult> $experiment_root/$TESTSUBJECT/outputs/t146 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.ClassInitializerTest.testCoverageResult $VER

echo " running test 147"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testSimple2> $experiment_root/$TESTSUBJECT/outputs/t147 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testSimple2 $VER

echo " running test 148"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testIf1> $experiment_root/$TESTSUBJECT/outputs/t148 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testIf1 $VER

echo " running test 149"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testIf2> $experiment_root/$TESTSUBJECT/outputs/t149 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testIf2 $VER

echo " running test 150"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testSimple1> $experiment_root/$TESTSUBJECT/outputs/t150 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testSimple1 $VER

echo " running test 151"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testIf3> $experiment_root/$TESTSUBJECT/outputs/t151 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testIf3 $VER

echo " running test 152"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testTwoIf1> $experiment_root/$TESTSUBJECT/outputs/t152 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testTwoIf1 $VER

echo " running test 153"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testTwoIf2> $experiment_root/$TESTSUBJECT/outputs/t153 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testTwoIf2 $VER

echo " running test 154"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testTwoIf3> $experiment_root/$TESTSUBJECT/outputs/t154 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testTwoIf3 $VER

echo " running test 155"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testTwoIf4> $experiment_root/$TESTSUBJECT/outputs/t155 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testTwoIf4 $VER

echo " running test 156"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testNestedIf1> $experiment_root/$TESTSUBJECT/outputs/t156 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testNestedIf1 $VER

echo " running test 157"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testNestedIf2> $experiment_root/$TESTSUBJECT/outputs/t157 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testNestedIf2 $VER

echo " running test 158"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testNestedIf3> $experiment_root/$TESTSUBJECT/outputs/t158 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testNestedIf3 $VER

echo " running test 159"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testNestedIf4> $experiment_root/$TESTSUBJECT/outputs/t159 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testNestedIf4 $VER

echo " running test 160"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testSwitch1> $experiment_root/$TESTSUBJECT/outputs/t160 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testSwitch1 $VER

echo " running test 161"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testSwitch2> $experiment_root/$TESTSUBJECT/outputs/t161 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testSwitch2 $VER

echo " running test 162"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testSwitch3> $experiment_root/$TESTSUBJECT/outputs/t162 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testSwitch3 $VER

echo " running test 163"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.CyclomaticComplexityTest.testSwitch4> $experiment_root/$TESTSUBJECT/outputs/t163 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.CyclomaticComplexityTest.testSwitch4 $VER

echo " running test 164"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.PrivateEmptyDefaultConstructorTest.testCoverageResult> $experiment_root/$TESTSUBJECT/outputs/t164 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.PrivateEmptyDefaultConstructorTest.testCoverageResult $VER

echo " running test 165"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.BooleanExpressionsTest.testCoverageResult> $experiment_root/$TESTSUBJECT/outputs/t165 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.BooleanExpressionsTest.testCoverageResult $VER

echo " running test 166"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.ControlStructuresTest.testCoverageResult> $experiment_root/$TESTSUBJECT/outputs/t166 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.ControlStructuresTest.testCoverageResult $VER

echo " running test 167"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.ProbesBeforeSuperConstructorTest.testCoverageResult> $experiment_root/$TESTSUBJECT/outputs/t167 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.ProbesBeforeSuperConstructorTest.testCoverageResult $VER

echo " running test 168"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.ImplicitDefaultConstructorTest.testCoverageResult> $experiment_root/$TESTSUBJECT/outputs/t168 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.ImplicitDefaultConstructorTest.testCoverageResult $VER

echo " running test 169"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.ImplicitFieldInitializationTest.testCoverageResult> $experiment_root/$TESTSUBJECT/outputs/t169 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.ImplicitFieldInitializationTest.testCoverageResult $VER

echo " running test 170"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.SourceTest.testGetLineNumberNegative> $experiment_root/$TESTSUBJECT/outputs/t170 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.SourceTest.testGetLineNumberNegative $VER

echo " running test 171"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.SourceTest.testDuplicateTag> $experiment_root/$TESTSUBJECT/outputs/t171 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.SourceTest.testDuplicateTag $VER

echo " running test 172"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.SourceTest.testGetSourceFor> $experiment_root/$TESTSUBJECT/outputs/t172 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.SourceTest.testGetSourceFor $VER

echo " running test 173"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.SourceTest.testGetLine> $experiment_root/$TESTSUBJECT/outputs/t173 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.SourceTest.testGetLine $VER

echo " running test 174"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.SourceTest.testGetLineNumber> $experiment_root/$TESTSUBJECT/outputs/t174 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.SourceTest.testGetLineNumber $VER

echo " running test 175"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.SourceTest.testGetLines2> $experiment_root/$TESTSUBJECT/outputs/t175 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.SourceTest.testGetLines2 $VER

echo " running test 176"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.SourceTest.testGetLines3> $experiment_root/$TESTSUBJECT/outputs/t176 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.SourceTest.testGetLines3 $VER

echo " running test 177"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.SourceTest.testGetLines1> $experiment_root/$TESTSUBJECT/outputs/t177 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.SourceTest.testGetLines1 $VER

echo " running test 178"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.test.validation.InterfaceClassInitializerTest.testCoverageResult> $experiment_root/$TESTSUBJECT/outputs/t178 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.InterfaceClassInitializerTest.testCoverageResult $VER

echo " running test 179"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataStoreTest.testReset> $experiment_root/$TESTSUBJECT/outputs/t179 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest.testReset $VER

echo " running test 180"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataStoreTest.testEmpty> $experiment_root/$TESTSUBJECT/outputs/t180 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest.testEmpty $VER

echo " running test 181"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataStoreTest.testGetNegative1> $experiment_root/$TESTSUBJECT/outputs/t181 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest.testGetNegative1 $VER

echo " running test 182"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataStoreTest.testGetNegative2> $experiment_root/$TESTSUBJECT/outputs/t182 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest.testGetNegative2 $VER

echo " running test 183"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataStoreTest.testPutNegative> $experiment_root/$TESTSUBJECT/outputs/t183 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest.testPutNegative $VER

echo " running test 184"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataStoreTest.testPut> $experiment_root/$TESTSUBJECT/outputs/t184 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest.testPut $VER

echo " running test 185"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataStoreTest.testGetContents> $experiment_root/$TESTSUBJECT/outputs/t185 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest.testGetContents $VER

echo " running test 186"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataStoreTest.testGetWithoutCreate> $experiment_root/$TESTSUBJECT/outputs/t186 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest.testGetWithoutCreate $VER

echo " running test 187"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataStoreTest.testGetWithCreate> $experiment_root/$TESTSUBJECT/outputs/t187 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest.testGetWithCreate $VER

echo " running test 188"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataStoreTest.testMerge> $experiment_root/$TESTSUBJECT/outputs/t188 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest.testMerge $VER

echo " running test 189"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataStoreTest.testMergeNegative> $experiment_root/$TESTSUBJECT/outputs/t189 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest.testMergeNegative $VER

echo " running test 190"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataTest.testReset> $experiment_root/$TESTSUBJECT/outputs/t190 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataTest.testReset $VER

echo " running test 191"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataTest.testToString> $experiment_root/$TESTSUBJECT/outputs/t191 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataTest.testToString $VER

echo " running test 192"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataTest.testCreateEmpty> $experiment_root/$TESTSUBJECT/outputs/t192 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataTest.testCreateEmpty $VER

echo " running test 193"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataTest.testAssertCompatibility> $experiment_root/$TESTSUBJECT/outputs/t193 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataTest.testAssertCompatibility $VER

echo " running test 194"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataTest.testGetters> $experiment_root/$TESTSUBJECT/outputs/t194 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataTest.testGetters $VER

echo " running test 195"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataTest.testAssertCompatibilityNegative1> $experiment_root/$TESTSUBJECT/outputs/t195 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataTest.testAssertCompatibilityNegative1 $VER

echo " running test 196"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataTest.testAssertCompatibilityNegative2> $experiment_root/$TESTSUBJECT/outputs/t196 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataTest.testAssertCompatibilityNegative2 $VER

echo " running test 197"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataTest.testAssertCompatibilityNegative3> $experiment_root/$TESTSUBJECT/outputs/t197 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataTest.testAssertCompatibilityNegative3 $VER

echo " running test 198"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataTest.testMerge> $experiment_root/$TESTSUBJECT/outputs/t198 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataTest.testMerge $VER

echo " running test 199"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.SessionInfoTest.testToString> $experiment_root/$TESTSUBJECT/outputs/t199 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoTest.testToString $VER

echo " running test 200"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.SessionInfoTest.testGetters> $experiment_root/$TESTSUBJECT/outputs/t200 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoTest.testGetters $VER

echo " running test 201"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.SessionInfoTest.testNullId> $experiment_root/$TESTSUBJECT/outputs/t201 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoTest.testNullId $VER

echo " running test 202"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.SessionInfoTest.testCompare> $experiment_root/$TESTSUBJECT/outputs/t202 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoTest.testCompare $VER

echo " running test 203"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testSessionInfo> $experiment_root/$TESTSUBJECT/outputs/t203 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testSessionInfo $VER

echo " running test 204"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testEmpty> $experiment_root/$TESTSUBJECT/outputs/t204 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testEmpty $VER

echo " running test 205"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testFlush> $experiment_root/$TESTSUBJECT/outputs/t205 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testFlush $VER

echo " running test 206"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testCustomBlocks> $experiment_root/$TESTSUBJECT/outputs/t206 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testCustomBlocks $VER

echo " running test 207"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testGetFileHeader> $experiment_root/$TESTSUBJECT/outputs/t207 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testGetFileHeader $VER

echo " running test 208"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testMultipleHeaders> $experiment_root/$TESTSUBJECT/outputs/t208 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testMultipleHeaders $VER

echo " running test 209"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testInvalidMagicNumber> $experiment_root/$TESTSUBJECT/outputs/t209 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testInvalidMagicNumber $VER

echo " running test 210"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testInvalidHeaderVersion> $experiment_root/$TESTSUBJECT/outputs/t210 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testInvalidHeaderVersion $VER

echo " running test 211"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testMissingHeader> $experiment_root/$TESTSUBJECT/outputs/t211 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testMissingHeader $VER

echo " running test 212"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testUnknownBlock> $experiment_root/$TESTSUBJECT/outputs/t212 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testUnknownBlock $VER

echo " running test 213"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testEmptyFile> $experiment_root/$TESTSUBJECT/outputs/t213 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testEmptyFile $VER

echo " running test 214"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testNoSessionInfoVisitor> $experiment_root/$TESTSUBJECT/outputs/t214 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testNoSessionInfoVisitor $VER

echo " running test 215"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testSessionInfoIOException> $experiment_root/$TESTSUBJECT/outputs/t215 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testSessionInfoIOException $VER

echo " running test 216"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testNoExecutionDataVisitor> $experiment_root/$TESTSUBJECT/outputs/t216 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testNoExecutionDataVisitor $VER

echo " running test 217"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testMinClassId> $experiment_root/$TESTSUBJECT/outputs/t217 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testMinClassId $VER

echo " running test 218"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testMaxClassId> $experiment_root/$TESTSUBJECT/outputs/t218 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testMaxClassId $VER

echo " running test 219"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testEmptyClass> $experiment_root/$TESTSUBJECT/outputs/t219 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testEmptyClass $VER

echo " running test 220"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testOneClass> $experiment_root/$TESTSUBJECT/outputs/t220 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testOneClass $VER

echo " running test 221"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testTwoClasses> $experiment_root/$TESTSUBJECT/outputs/t221 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testTwoClasses $VER

echo " running test 222"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testBigClass> $experiment_root/$TESTSUBJECT/outputs/t222 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testBigClass $VER

echo " running test 223"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.ExecutionDataReaderWriterTest.testExecutionDataIOException> $experiment_root/$TESTSUBJECT/outputs/t223 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest.testExecutionDataIOException $VER

echo " running test 224"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.SessionInfoStoreTest.testEmpty> $experiment_root/$TESTSUBJECT/outputs/t224 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoStoreTest.testEmpty $VER

echo " running test 225"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.SessionInfoStoreTest.testGetMergedEmpty> $experiment_root/$TESTSUBJECT/outputs/t225 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoStoreTest.testGetMergedEmpty $VER

echo " running test 226"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.SessionInfoStoreTest.testGetMerged> $experiment_root/$TESTSUBJECT/outputs/t226 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoStoreTest.testGetMerged $VER

echo " running test 227"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.SessionInfoStoreTest.testAccept> $experiment_root/$TESTSUBJECT/outputs/t227 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoStoreTest.testAccept $VER

echo " running test 228"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.SessionInfoStoreTest.testGetInfos> $experiment_root/$TESTSUBJECT/outputs/t228 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoStoreTest.testGetInfos $VER

echo " running test 229"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.data.SessionInfoStoreTest.testIsEmpty> $experiment_root/$TESTSUBJECT/outputs/t229 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoStoreTest.testIsEmpty $VER

echo " running test 230"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelInfoTest.testDefaults> $experiment_root/$TESTSUBJECT/outputs/t230 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest.testDefaults $VER

echo " running test 231"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelInfoTest.testOtherInfoObject> $experiment_root/$TESTSUBJECT/outputs/t231 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest.testOtherInfoObject $VER

echo " running test 232"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelInfoTest.testSuccessor> $experiment_root/$TESTSUBJECT/outputs/t232 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest.testSuccessor $VER

echo " running test 233"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelInfoTest.testMultiTarget1> $experiment_root/$TESTSUBJECT/outputs/t233 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest.testMultiTarget1 $VER

echo " running test 234"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelInfoTest.testMultiTarget2> $experiment_root/$TESTSUBJECT/outputs/t234 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest.testMultiTarget2 $VER

echo " running test 235"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelInfoTest.testMultiTarget3> $experiment_root/$TESTSUBJECT/outputs/t235 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest.testMultiTarget3 $VER

echo " running test 236"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelInfoTest.testSetResetDone1> $experiment_root/$TESTSUBJECT/outputs/t236 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest.testSetResetDone1 $VER

echo " running test 237"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelInfoTest.testSetResetDone2> $experiment_root/$TESTSUBJECT/outputs/t237 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest.testSetResetDone2 $VER

echo " running test 238"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelInfoTest.testSetProbeId> $experiment_root/$TESTSUBJECT/outputs/t238 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest.testSetProbeId $VER

echo " running test 239"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelInfoTest.testSetIntermediateLabel> $experiment_root/$TESTSUBJECT/outputs/t239 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest.testSetIntermediateLabel $VER

echo " running test 240"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelInfoTest.testSetInstruction> $experiment_root/$TESTSUBJECT/outputs/t240 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest.testSetInstruction $VER

echo " running test 241"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.InstructionTest.testInit> $experiment_root/$TESTSUBJECT/outputs/t241 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.InstructionTest.testInit $VER

echo " running test 242"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.InstructionTest.testAddBranch> $experiment_root/$TESTSUBJECT/outputs/t242 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.InstructionTest.testAddBranch $VER

echo " running test 243"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.InstructionTest.testSetPredecessor> $experiment_root/$TESTSUBJECT/outputs/t243 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.InstructionTest.testSetPredecessor $VER

echo " running test 244"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.InstructionTest.testSetCovered> $experiment_root/$TESTSUBJECT/outputs/t244 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.InstructionTest.testSetCovered $VER

echo " running test 245"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.InstructionTest.testSetCoveredOnLongSequence> $experiment_root/$TESTSUBJECT/outputs/t245 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.InstructionTest.testSetCoveredOnLongSequence $VER

echo " running test 246"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitProbe2> $experiment_root/$TESTSUBJECT/outputs/t246 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitProbe2 $VER

echo " running test 247"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitInsn1> $experiment_root/$TESTSUBJECT/outputs/t247 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitInsn1 $VER

echo " running test 248"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitInsn2> $experiment_root/$TESTSUBJECT/outputs/t248 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitInsn2 $VER

echo " running test 249"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitJumpInsn1> $experiment_root/$TESTSUBJECT/outputs/t249 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitJumpInsn1 $VER

echo " running test 250"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitJumpInsn2> $experiment_root/$TESTSUBJECT/outputs/t250 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitJumpInsn2 $VER

echo " running test 251"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitLookupSwitchInsn1> $experiment_root/$TESTSUBJECT/outputs/t251 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitLookupSwitchInsn1 $VER

echo " running test 252"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitLookupSwitchInsn2> $experiment_root/$TESTSUBJECT/outputs/t252 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitLookupSwitchInsn2 $VER

echo " running test 253"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitLookupSwitchInsn3> $experiment_root/$TESTSUBJECT/outputs/t253 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitLookupSwitchInsn3 $VER

echo " running test 254"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitTableSwitchInsn1> $experiment_root/$TESTSUBJECT/outputs/t254 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitTableSwitchInsn1 $VER

echo " running test 255"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitTableSwitchInsn2> $experiment_root/$TESTSUBJECT/outputs/t255 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitTableSwitchInsn2 $VER

echo " running test 256"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitTableSwitchInsn3> $experiment_root/$TESTSUBJECT/outputs/t256 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitTableSwitchInsn3 $VER

echo " running test 257"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitProbe1> $experiment_root/$TESTSUBJECT/outputs/t257 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest.testVisitProbe1 $VER

echo " running test 258"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testInit> $experiment_root/$TESTSUBJECT/outputs/t258 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testInit $VER

echo " running test 259"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario01> $experiment_root/$TESTSUBJECT/outputs/t259 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario01 $VER

echo " running test 260"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testInsn> $experiment_root/$TESTSUBJECT/outputs/t260 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testInsn $VER

echo " running test 261"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testVisitInsnNegative> $experiment_root/$TESTSUBJECT/outputs/t261 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testVisitInsnNegative $VER

echo " running test 262"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testIntInsn> $experiment_root/$TESTSUBJECT/outputs/t262 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testIntInsn $VER

echo " running test 263"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testVarInsn> $experiment_root/$TESTSUBJECT/outputs/t263 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testVarInsn $VER

echo " running test 264"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testTypeInsn> $experiment_root/$TESTSUBJECT/outputs/t264 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testTypeInsn $VER

echo " running test 265"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFieldInsn> $experiment_root/$TESTSUBJECT/outputs/t265 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFieldInsn $VER

echo " running test 266"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testMethodInsn> $experiment_root/$TESTSUBJECT/outputs/t266 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testMethodInsn $VER

echo " running test 267"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testJumpInsn> $experiment_root/$TESTSUBJECT/outputs/t267 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testJumpInsn $VER

echo " running test 268"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testVisitJumpInsnNegative> $experiment_root/$TESTSUBJECT/outputs/t268 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testVisitJumpInsnNegative $VER

echo " running test 269"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testLdcInsn> $experiment_root/$TESTSUBJECT/outputs/t269 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testLdcInsn $VER

echo " running test 270"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testIincInsn> $experiment_root/$TESTSUBJECT/outputs/t270 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testIincInsn $VER

echo " running test 271"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testTableSwitchInsn> $experiment_root/$TESTSUBJECT/outputs/t271 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testTableSwitchInsn $VER

echo " running test 272"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testLookupSwitchInsn> $experiment_root/$TESTSUBJECT/outputs/t272 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testLookupSwitchInsn $VER

echo " running test 273"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testMultiANewArrayInsn> $experiment_root/$TESTSUBJECT/outputs/t273 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testMultiANewArrayInsn $VER

echo " running test 274"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario02> $experiment_root/$TESTSUBJECT/outputs/t274 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario02 $VER

echo " running test 275"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario03> $experiment_root/$TESTSUBJECT/outputs/t275 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario03 $VER

echo " running test 276"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario04> $experiment_root/$TESTSUBJECT/outputs/t276 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario04 $VER

echo " running test 277"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario05> $experiment_root/$TESTSUBJECT/outputs/t277 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario05 $VER

echo " running test 278"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario06> $experiment_root/$TESTSUBJECT/outputs/t278 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario06 $VER

echo " running test 279"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario07> $experiment_root/$TESTSUBJECT/outputs/t279 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario07 $VER

echo " running test 280"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario08> $experiment_root/$TESTSUBJECT/outputs/t280 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario08 $VER

echo " running test 281"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario09> $experiment_root/$TESTSUBJECT/outputs/t281 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario09 $VER

echo " running test 282"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario10> $experiment_root/$TESTSUBJECT/outputs/t282 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario10 $VER

echo " running test 283"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario11> $experiment_root/$TESTSUBJECT/outputs/t283 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario11 $VER

echo " running test 284"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario12> $experiment_root/$TESTSUBJECT/outputs/t284 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest.testFlowScenario12 $VER

echo " running test 285"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.ClassProbesAdapterTest.testProbeCounter> $experiment_root/$TESTSUBJECT/outputs/t285 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.ClassProbesAdapterTest.testProbeCounter $VER

echo " running test 286"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.ClassProbesAdapterTest.testVisitClassMethods> $experiment_root/$TESTSUBJECT/outputs/t286 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.ClassProbesAdapterTest.testVisitClassMethods $VER

echo " running test 287"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.ClassProbesAdapterTest.testVisitInterfaceMethod> $experiment_root/$TESTSUBJECT/outputs/t287 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.ClassProbesAdapterTest.testVisitInterfaceMethod $VER

echo " running test 288"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.flow.ClassProbesAdapterTest.testVisitMethodNullMethodVisitor> $experiment_root/$TESTSUBJECT/outputs/t288 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.ClassProbesAdapterTest.testVisitMethodNullMethodVisitor $VER

echo " running test 289"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceFileCoverageImplTest.testProperties> $experiment_root/$TESTSUBJECT/outputs/t289 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceFileCoverageImplTest.testProperties $VER

echo " running test 290"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchCovered2> $experiment_root/$TESTSUBJECT/outputs/t290 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchCovered2 $VER

echo " running test 291"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchCovered3> $experiment_root/$TESTSUBJECT/outputs/t291 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchCovered3 $VER

echo " running test 292"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchMergeNotCovered> $experiment_root/$TESTSUBJECT/outputs/t292 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchMergeNotCovered $VER

echo " running test 293"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchMergeNotCovered1> $experiment_root/$TESTSUBJECT/outputs/t293 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchMergeNotCovered1 $VER

echo " running test 294"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchMergeNotCovered2> $experiment_root/$TESTSUBJECT/outputs/t294 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchMergeNotCovered2 $VER

echo " running test 295"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchMergeNotCovered3> $experiment_root/$TESTSUBJECT/outputs/t295 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchMergeNotCovered3 $VER

echo " running test 296"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchMergeNotCovered4> $experiment_root/$TESTSUBJECT/outputs/t296 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchMergeNotCovered4 $VER

echo " running test 297"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testLinearSequenceNotCovered1> $experiment_root/$TESTSUBJECT/outputs/t297 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testLinearSequenceNotCovered1 $VER

echo " running test 298"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testLinearSequenceNotCovered2> $experiment_root/$TESTSUBJECT/outputs/t298 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testLinearSequenceNotCovered2 $VER

echo " running test 299"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testLinearSequenceCovered> $experiment_root/$TESTSUBJECT/outputs/t299 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testLinearSequenceCovered $VER

echo " running test 300"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchNotCovered> $experiment_root/$TESTSUBJECT/outputs/t300 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchNotCovered $VER

echo " running test 301"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchCovered1> $experiment_root/$TESTSUBJECT/outputs/t301 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchCovered1 $VER

echo " running test 302"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchCovered2> $experiment_root/$TESTSUBJECT/outputs/t302 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchCovered2 $VER

echo " running test 303"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchCovered3> $experiment_root/$TESTSUBJECT/outputs/t303 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchCovered3 $VER

echo " running test 304"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchMergeNotCovered> $experiment_root/$TESTSUBJECT/outputs/t304 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchMergeNotCovered $VER

echo " running test 305"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchMergeCovered1> $experiment_root/$TESTSUBJECT/outputs/t305 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchMergeCovered1 $VER

echo " running test 306"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchMergeCovered2> $experiment_root/$TESTSUBJECT/outputs/t306 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchMergeCovered2 $VER

echo " running test 307"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchMergeCovered3> $experiment_root/$TESTSUBJECT/outputs/t307 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testIfBranchMergeCovered3 $VER

echo " running test 308"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testJumpBackwardsNotCovered> $experiment_root/$TESTSUBJECT/outputs/t308 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testJumpBackwardsNotCovered $VER

echo " running test 309"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testJumpBackwardsCovered> $experiment_root/$TESTSUBJECT/outputs/t309 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testJumpBackwardsCovered $VER

echo " running test 310"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testJumpToFirstNotCovered> $experiment_root/$TESTSUBJECT/outputs/t310 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testJumpToFirstNotCovered $VER

echo " running test 311"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testJumpToFirstCovered1> $experiment_root/$TESTSUBJECT/outputs/t311 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testJumpToFirstCovered1 $VER

echo " running test 312"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testJumpToFirstCovered2> $experiment_root/$TESTSUBJECT/outputs/t312 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testJumpToFirstCovered2 $VER

echo " running test 313"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchNotCovered> $experiment_root/$TESTSUBJECT/outputs/t313 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchNotCovered $VER

echo " running test 314"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchCovered1> $experiment_root/$TESTSUBJECT/outputs/t314 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest.testTableSwitchCovered1 $VER

echo " running test 315"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testInit> $experiment_root/$TESTSUBJECT/outputs/t315 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testInit $VER

echo " running test 316"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testGetLine> $experiment_root/$TESTSUBJECT/outputs/t316 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testGetLine $VER

echo " running test 317"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testEnsureCapacityUnknown2> $experiment_root/$TESTSUBJECT/outputs/t317 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testEnsureCapacityUnknown2 $VER

echo " running test 318"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLineUnknown> $experiment_root/$TESTSUBJECT/outputs/t318 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLineUnknown $VER

echo " running test 319"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLines> $experiment_root/$TESTSUBJECT/outputs/t319 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLines $VER

echo " running test 320"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine1_1> $experiment_root/$TESTSUBJECT/outputs/t320 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine1_1 $VER

echo " running test 321"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine1_2> $experiment_root/$TESTSUBJECT/outputs/t321 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine1_2 $VER

echo " running test 322"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine1_3> $experiment_root/$TESTSUBJECT/outputs/t322 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine1_3 $VER

echo " running test 323"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine1_4> $experiment_root/$TESTSUBJECT/outputs/t323 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine1_4 $VER

echo " running test 324"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine2_1> $experiment_root/$TESTSUBJECT/outputs/t324 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine2_1 $VER

echo " running test 325"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine2_2> $experiment_root/$TESTSUBJECT/outputs/t325 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine2_2 $VER

echo " running test 326"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine2_3> $experiment_root/$TESTSUBJECT/outputs/t326 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine2_3 $VER

echo " running test 327"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine2_4> $experiment_root/$TESTSUBJECT/outputs/t327 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine2_4 $VER

echo " running test 328"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine3_1> $experiment_root/$TESTSUBJECT/outputs/t328 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine3_1 $VER

echo " running test 329"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine3_2> $experiment_root/$TESTSUBJECT/outputs/t329 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine3_2 $VER

echo " running test 330"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine3_3> $experiment_root/$TESTSUBJECT/outputs/t330 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine3_3 $VER

echo " running test 331"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine3_4> $experiment_root/$TESTSUBJECT/outputs/t331 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine3_4 $VER

echo " running test 332"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine4_1> $experiment_root/$TESTSUBJECT/outputs/t332 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine4_1 $VER

echo " running test 333"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine4_2> $experiment_root/$TESTSUBJECT/outputs/t333 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine4_2 $VER

echo " running test 334"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine4_3> $experiment_root/$TESTSUBJECT/outputs/t334 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine4_3 $VER

echo " running test 335"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine4_4> $experiment_root/$TESTSUBJECT/outputs/t335 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementLine4_4 $VER

echo " running test 336"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementChildNoLines> $experiment_root/$TESTSUBJECT/outputs/t336 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementChildNoLines $VER

echo " running test 337"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementChildWithLines> $experiment_root/$TESTSUBJECT/outputs/t337 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testIncrementChildWithLines $VER

echo " running test 338"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.SourceNodeImplTest.testEnsureCapacityUnknown1> $experiment_root/$TESTSUBJECT/outputs/t338 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest.testEnsureCapacityUnknown1 $VER

echo " running test 339"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testProperties> $experiment_root/$TESTSUBJECT/outputs/t339 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testProperties $VER

echo " running test 340"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testEmptyMethod> $experiment_root/$TESTSUBJECT/outputs/t340 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testEmptyMethod $VER

echo " running test 341"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementMissedInstructions> $experiment_root/$TESTSUBJECT/outputs/t341 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementMissedInstructions $VER

echo " running test 342"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementCoveredInstructions> $experiment_root/$TESTSUBJECT/outputs/t342 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementCoveredInstructions $VER

echo " running test 343"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity1> $experiment_root/$TESTSUBJECT/outputs/t343 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity1 $VER

echo " running test 344"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity2> $experiment_root/$TESTSUBJECT/outputs/t344 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity2 $VER

echo " running test 345"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity3> $experiment_root/$TESTSUBJECT/outputs/t345 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity3 $VER

echo " running test 346"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity4> $experiment_root/$TESTSUBJECT/outputs/t346 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity4 $VER

echo " running test 347"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity5> $experiment_root/$TESTSUBJECT/outputs/t347 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity5 $VER

echo " running test 348"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity6> $experiment_root/$TESTSUBJECT/outputs/t348 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity6 $VER

echo " running test 349"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity7> $experiment_root/$TESTSUBJECT/outputs/t349 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity7 $VER

echo " running test 350"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity8> $experiment_root/$TESTSUBJECT/outputs/t350 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest.testIncrementComplexity8 $VER

echo " running test 351"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.BundleCoverageImplTest.testProperties> $experiment_root/$TESTSUBJECT/outputs/t351 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.BundleCoverageImplTest.testProperties $VER

echo " running test 352"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.BundleCoverageImplTest.testCounters> $experiment_root/$TESTSUBJECT/outputs/t352 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.BundleCoverageImplTest.testCounters $VER

echo " running test 353"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.BundleCoverageImplTest.testGroupByPackage> $experiment_root/$TESTSUBJECT/outputs/t353 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.BundleCoverageImplTest.testGroupByPackage $VER

echo " running test 354"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testIncrement2> $experiment_root/$TESTSUBJECT/outputs/t354 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testIncrement2 $VER

echo " running test 355"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testIncrement3> $experiment_root/$TESTSUBJECT/outputs/t355 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testIncrement3 $VER

echo " running test 356"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testIncrement4> $experiment_root/$TESTSUBJECT/outputs/t356 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testIncrement4 $VER

echo " running test 357"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testIncrement5> $experiment_root/$TESTSUBJECT/outputs/t357 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testIncrement5 $VER

echo " running test 358"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testGetStatus1> $experiment_root/$TESTSUBJECT/outputs/t358 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testGetStatus1 $VER

echo " running test 359"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testGetStatus2> $experiment_root/$TESTSUBJECT/outputs/t359 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testGetStatus2 $VER

echo " running test 360"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testGetStatus3> $experiment_root/$TESTSUBJECT/outputs/t360 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testGetStatus3 $VER

echo " running test 361"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testGetStatus4> $experiment_root/$TESTSUBJECT/outputs/t361 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testGetStatus4 $VER

echo " running test 362"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testGetStatus5> $experiment_root/$TESTSUBJECT/outputs/t362 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testGetStatus5 $VER

echo " running test 363"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testGetStatus6> $experiment_root/$TESTSUBJECT/outputs/t363 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testGetStatus6 $VER

echo " running test 364"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testHashCode> $experiment_root/$TESTSUBJECT/outputs/t364 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testHashCode $VER

echo " running test 365"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testEquals1> $experiment_root/$TESTSUBJECT/outputs/t365 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testEquals1 $VER

echo " running test 366"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testEquals2> $experiment_root/$TESTSUBJECT/outputs/t366 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testEquals2 $VER

echo " running test 367"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testEquals3> $experiment_root/$TESTSUBJECT/outputs/t367 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testEquals3 $VER

echo " running test 368"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testEquals4> $experiment_root/$TESTSUBJECT/outputs/t368 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testEquals4 $VER

echo " running test 369"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testEMPTY> $experiment_root/$TESTSUBJECT/outputs/t369 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testEMPTY $VER

echo " running test 370"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.LineImplTest.testIncrement1> $experiment_root/$TESTSUBJECT/outputs/t370 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest.testIncrement1 $VER

echo " running test 371"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ClassCoverageImplTest.testEmptyClass> $experiment_root/$TESTSUBJECT/outputs/t371 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ClassCoverageImplTest.testEmptyClass $VER

echo " running test 372"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ClassCoverageImplTest.testProperties> $experiment_root/$TESTSUBJECT/outputs/t372 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ClassCoverageImplTest.testProperties $VER

echo " running test 373"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ClassCoverageImplTest.testAddMethodMissed> $experiment_root/$TESTSUBJECT/outputs/t373 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ClassCoverageImplTest.testAddMethodMissed $VER

echo " running test 374"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ClassCoverageImplTest.testGetPackageName1> $experiment_root/$TESTSUBJECT/outputs/t374 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ClassCoverageImplTest.testGetPackageName1 $VER

echo " running test 375"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ClassCoverageImplTest.testGetPackageName2> $experiment_root/$TESTSUBJECT/outputs/t375 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ClassCoverageImplTest.testGetPackageName2 $VER

echo " running test 376"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ClassCoverageImplTest.testAddMethodCovered> $experiment_root/$TESTSUBJECT/outputs/t376 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ClassCoverageImplTest.testAddMethodCovered $VER

echo " running test 377"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.StringPoolTest.testGetString> $experiment_root/$TESTSUBJECT/outputs/t377 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.StringPoolTest.testGetString $VER

echo " running test 378"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.StringPoolTest.testGetArrayNull> $experiment_root/$TESTSUBJECT/outputs/t378 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.StringPoolTest.testGetArrayNull $VER

echo " running test 379"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.StringPoolTest.testGetEmptyArray> $experiment_root/$TESTSUBJECT/outputs/t379 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.StringPoolTest.testGetEmptyArray $VER

echo " running test 380"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.StringPoolTest.testGetArray> $experiment_root/$TESTSUBJECT/outputs/t380 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.StringPoolTest.testGetArray $VER

echo " running test 381"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.StringPoolTest.testGetStringNull> $experiment_root/$TESTSUBJECT/outputs/t381 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.StringPoolTest.testGetStringNull $VER

echo " running test 382"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.PackageCoverageTest.testProperties> $experiment_root/$TESTSUBJECT/outputs/t382 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.PackageCoverageTest.testProperties $VER

echo " running test 383"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.PackageCoverageTest.testCountersWithSources> $experiment_root/$TESTSUBJECT/outputs/t383 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.PackageCoverageTest.testCountersWithSources $VER

echo " running test 384"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.PackageCoverageTest.testCountersWithoutSources> $experiment_root/$TESTSUBJECT/outputs/t384 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.PackageCoverageTest.testCountersWithoutSources $VER

echo " running test 385"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testEmptyStream> $experiment_root/$TESTSUBJECT/outputs/t385 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testEmptyStream $VER

echo " running test 386"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile> $experiment_root/$TESTSUBJECT/outputs/t386 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile $VER

echo " running test 387"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile11> $experiment_root/$TESTSUBJECT/outputs/t387 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile11 $VER

echo " running test 388"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile12> $experiment_root/$TESTSUBJECT/outputs/t388 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile12 $VER

echo " running test 389"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile13> $experiment_root/$TESTSUBJECT/outputs/t389 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile13 $VER

echo " running test 390"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile14> $experiment_root/$TESTSUBJECT/outputs/t390 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile14 $VER

echo " running test 391"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile15> $experiment_root/$TESTSUBJECT/outputs/t391 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile15 $VER

echo " running test 392"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile16> $experiment_root/$TESTSUBJECT/outputs/t392 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile16 $VER

echo " running test 393"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile17> $experiment_root/$TESTSUBJECT/outputs/t393 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testClassFile17 $VER

echo " running test 394"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testMachObjectFile> $experiment_root/$TESTSUBJECT/outputs/t394 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testMachObjectFile $VER

echo " running test 395"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testZipFile> $experiment_root/$TESTSUBJECT/outputs/t395 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testZipFile $VER

echo " running test 396"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testStreamWithoutMarkSupport> $experiment_root/$TESTSUBJECT/outputs/t396 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest.testStreamWithoutMarkSupport $VER

echo " running test 397"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testToString> $experiment_root/$TESTSUBJECT/outputs/t397 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testToString $VER

echo " running test 398"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testIncrement2> $experiment_root/$TESTSUBJECT/outputs/t398 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testIncrement2 $VER

echo " running test 399"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testEquals1> $experiment_root/$TESTSUBJECT/outputs/t399 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testEquals1 $VER

echo " running test 400"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testEquals2> $experiment_root/$TESTSUBJECT/outputs/t400 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testEquals2 $VER

echo " running test 401"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testEquals3> $experiment_root/$TESTSUBJECT/outputs/t401 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testEquals3 $VER

echo " running test 402"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testEquals4> $experiment_root/$TESTSUBJECT/outputs/t402 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testEquals4 $VER

echo " running test 403"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetInstance1> $experiment_root/$TESTSUBJECT/outputs/t403 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetInstance1 $VER

echo " running test 404"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetInstance2> $experiment_root/$TESTSUBJECT/outputs/t404 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetInstance2 $VER

echo " running test 405"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetInstance3> $experiment_root/$TESTSUBJECT/outputs/t405 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetInstance3 $VER

echo " running test 406"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testFixInstance> $experiment_root/$TESTSUBJECT/outputs/t406 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testFixInstance $VER

echo " running test 407"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testVarInstance> $experiment_root/$TESTSUBJECT/outputs/t407 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testVarInstance $VER

echo " running test 408"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetCoveredRatio1> $experiment_root/$TESTSUBJECT/outputs/t408 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetCoveredRatio1 $VER

echo " running test 409"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetCoveredRatio2> $experiment_root/$TESTSUBJECT/outputs/t409 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetCoveredRatio2 $VER

echo " running test 410"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetCoveredRatio3> $experiment_root/$TESTSUBJECT/outputs/t410 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetCoveredRatio3 $VER

echo " running test 411"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedRatio1> $experiment_root/$TESTSUBJECT/outputs/t411 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedRatio1 $VER

echo " running test 412"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedRatio2> $experiment_root/$TESTSUBJECT/outputs/t412 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedRatio2 $VER

echo " running test 413"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedRatio3> $experiment_root/$TESTSUBJECT/outputs/t413 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedRatio3 $VER

echo " running test 414"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedStatus1> $experiment_root/$TESTSUBJECT/outputs/t414 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedStatus1 $VER

echo " running test 415"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedStatus2> $experiment_root/$TESTSUBJECT/outputs/t415 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedStatus2 $VER

echo " running test 416"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedStatus3> $experiment_root/$TESTSUBJECT/outputs/t416 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedStatus3 $VER

echo " running test 417"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedStatus4> $experiment_root/$TESTSUBJECT/outputs/t417 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testGetMissedStatus4 $VER

echo " running test 418"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testHashCode1> $experiment_root/$TESTSUBJECT/outputs/t418 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testHashCode1 $VER

echo " running test 419"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testHashCode2> $experiment_root/$TESTSUBJECT/outputs/t419 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testHashCode2 $VER

echo " running test 420"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testHashCode3> $experiment_root/$TESTSUBJECT/outputs/t420 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testHashCode3 $VER

echo " running test 421"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.analysis.CounterImplTest.testIncrement1> $experiment_root/$TESTSUBJECT/outputs/t421 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest.testIncrement1 $VER

echo " running test 422"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CRC64Test.test1> $experiment_root/$TESTSUBJECT/outputs/t422 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CRC64Test.test1 $VER

echo " running test 423"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CRC64Test.test2> $experiment_root/$TESTSUBJECT/outputs/t423 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CRC64Test.test2 $VER

echo " running test 424"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CRC64Test.test3> $experiment_root/$TESTSUBJECT/outputs/t424 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CRC64Test.test3 $VER

echo " running test 425"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CRC64Test.test0> $experiment_root/$TESTSUBJECT/outputs/t425 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CRC64Test.test0 $VER

echo " running test 426"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testPackedBoolean3> $experiment_root/$TESTSUBJECT/outputs/t426 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testPackedBoolean3 $VER

echo " running test 427"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testPackedBoolean8> $experiment_root/$TESTSUBJECT/outputs/t427 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testPackedBoolean8 $VER

echo " running test 428"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testPackedBoolean9> $experiment_root/$TESTSUBJECT/outputs/t428 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testPackedBoolean9 $VER

echo " running test 429"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarInt0x00000000> $experiment_root/$TESTSUBJECT/outputs/t429 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarInt0x00000000 $VER

echo " running test 430"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarInt0x0000007F> $experiment_root/$TESTSUBJECT/outputs/t430 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarInt0x0000007F $VER

echo " running test 431"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarInt0x00000080> $experiment_root/$TESTSUBJECT/outputs/t431 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarInt0x00000080 $VER

echo " running test 432"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarInt0x00000100> $experiment_root/$TESTSUBJECT/outputs/t432 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarInt0x00000100 $VER

echo " running test 433"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarInt0x12345678> $experiment_root/$TESTSUBJECT/outputs/t433 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarInt0x12345678 $VER

echo " running test 434"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarIntMinus1> $experiment_root/$TESTSUBJECT/outputs/t434 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarIntMinus1 $VER

echo " running test 435"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarIntMinValue> $experiment_root/$TESTSUBJECT/outputs/t435 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarIntMinValue $VER

echo " running test 436"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarIntMaxValue> $experiment_root/$TESTSUBJECT/outputs/t436 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testVarIntMaxValue $VER

echo " running test 437"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.data.CompactDataInputOutputTest.testPackedBooleanEmpty> $experiment_root/$TESTSUBJECT/outputs/t437 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest.testPackedBooleanEmpty $VER

echo " running test 438"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ClassInstrumenterTest.testInstrumentInstrumentedClass1> $experiment_root/$TESTSUBJECT/outputs/t438 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ClassInstrumenterTest.testInstrumentInstrumentedClass1 $VER

echo " running test 439"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ClassInstrumenterTest.testInstrumentInstrumentedClass2> $experiment_root/$TESTSUBJECT/outputs/t439 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ClassInstrumenterTest.testInstrumentInstrumentedClass2 $VER

echo " running test 440"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ClassInstrumenterTest.testNoMethodVisitor> $experiment_root/$TESTSUBJECT/outputs/t440 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ClassInstrumenterTest.testNoMethodVisitor $VER

echo " running test 441"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVariableStatic> $experiment_root/$TESTSUBJECT/outputs/t441 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVariableStatic $VER

echo " running test 442"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVariableNonStatic> $experiment_root/$TESTSUBJECT/outputs/t442 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVariableNonStatic $VER

echo " running test 443"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVariableNonStatic_JD> $experiment_root/$TESTSUBJECT/outputs/t443 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVariableNonStatic_JD $VER

echo " running test 444"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVariableNonStatic_IZObject> $experiment_root/$TESTSUBJECT/outputs/t444 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVariableNonStatic_IZObject $VER

echo " running test 445"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitVarIns> $experiment_root/$TESTSUBJECT/outputs/t445 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitVarIns $VER

echo " running test 446"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitIincInsn> $experiment_root/$TESTSUBJECT/outputs/t446 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitIincInsn $VER

echo " running test 447"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitLocalVariable> $experiment_root/$TESTSUBJECT/outputs/t447 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitLocalVariable $VER

echo " running test 448"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitMaxs> $experiment_root/$TESTSUBJECT/outputs/t448 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitMaxs $VER

echo " running test 449"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitFrame> $experiment_root/$TESTSUBJECT/outputs/t449 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitFrame $VER

echo " running test 450"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitFrameNegative> $experiment_root/$TESTSUBJECT/outputs/t450 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testVisitFrameNegative $VER

echo " running test 451"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testInsertProbeFrame> $experiment_root/$TESTSUBJECT/outputs/t451 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testInsertProbeFrame $VER

echo " running test 452"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testInsertProbeFrameNoFrameForLabel> $experiment_root/$TESTSUBJECT/outputs/t452 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testInsertProbeFrameNoFrameForLabel $VER

echo " running test 453"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.ProbeVariableInserterTest.testInsertProbeFrameNoMultiTarget> $experiment_root/$TESTSUBJECT/outputs/t453 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest.testInsertProbeFrameNoMultiTarget $VER

echo " running test 454"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitCode> $experiment_root/$TESTSUBJECT/outputs/t454 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitCode $VER

echo " running test 455"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitProbe> $experiment_root/$TESTSUBJECT/outputs/t455 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitProbe $VER

echo " running test 456"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitInsnWithProbe> $experiment_root/$TESTSUBJECT/outputs/t456 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitInsnWithProbe $VER

echo " running test 457"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitJumpInsnWithProbe_GOTO> $experiment_root/$TESTSUBJECT/outputs/t457 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitJumpInsnWithProbe_GOTO $VER

echo " running test 458"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitJumpInsnWithProbe> $experiment_root/$TESTSUBJECT/outputs/t458 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitJumpInsnWithProbe $VER

echo " running test 459"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitTableSwitchInsnWithProbes> $experiment_root/$TESTSUBJECT/outputs/t459 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitTableSwitchInsnWithProbes $VER

echo " running test 460"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitLookupSwitchInsnWithProbes> $experiment_root/$TESTSUBJECT/outputs/t460 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitLookupSwitchInsnWithProbes $VER

echo " running test 461"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitMaxs> $experiment_root/$TESTSUBJECT/outputs/t461 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.MethodInstrumenterTest.testVisitMaxs $VER

echo " running test 462"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushInt0> $experiment_root/$TESTSUBJECT/outputs/t462 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushInt0 $VER

echo " running test 463"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushInt1> $experiment_root/$TESTSUBJECT/outputs/t463 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushInt1 $VER

echo " running test 464"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushIntM2147483648> $experiment_root/$TESTSUBJECT/outputs/t464 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushIntM2147483648 $VER

echo " running test 465"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushIntM32768> $experiment_root/$TESTSUBJECT/outputs/t465 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushIntM32768 $VER

echo " running test 466"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushIntM128> $experiment_root/$TESTSUBJECT/outputs/t466 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushIntM128 $VER

echo " running test 467"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushIntM1> $experiment_root/$TESTSUBJECT/outputs/t467 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushIntM1 $VER

echo " running test 468"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushInt2> $experiment_root/$TESTSUBJECT/outputs/t468 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushInt2 $VER

echo " running test 469"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushInt3> $experiment_root/$TESTSUBJECT/outputs/t469 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushInt3 $VER

echo " running test 470"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushInt4> $experiment_root/$TESTSUBJECT/outputs/t470 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushInt4 $VER

echo " running test 471"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushInt5> $experiment_root/$TESTSUBJECT/outputs/t471 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushInt5 $VER

echo " running test 472"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushInt127> $experiment_root/$TESTSUBJECT/outputs/t472 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushInt127 $VER

echo " running test 473"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushInt32767> $experiment_root/$TESTSUBJECT/outputs/t473 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushInt32767 $VER

echo " running test 474"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.internal.instr.InstrSupportTest.testPushInt2147483647> $experiment_root/$TESTSUBJECT/outputs/t474 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest.testPushInt2147483647 $VER

echo " running test 475"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.jacoco.core.instr.InstrumenterTest.testSerialization> $experiment_root/$TESTSUBJECT/outputs/t475 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.instr.InstrumenterTest.testSerialization $VER

