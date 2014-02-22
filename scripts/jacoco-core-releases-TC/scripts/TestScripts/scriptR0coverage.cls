#!/bin/sh -x
TESTSUBJECT="jacoco-core-releases-TC"
TESTSUBJECT_ALT="jacoco_core"
VER=v0
EXCLUDEDCLASSES="org.jacoco.core.test.validation.targets.*:*Test\$*"
#EXCLUDEDCLASSES="org.jacoco.core.test.validation.targets.*:org.jacoco.core.instr.InstrumenterTest\$SerializationTarget"

unset CLASSPATH
CLASSPATH=".:$experiment_root/$TESTSUBJECT/versions.alt/orig/$VER/$TESTSUBJECT_ALT/build/classes:$experiment_root/$TESTSUBJECT/versions.alt/orig/$VER/$TESTSUBJECT_ALT/build/testcases:$experiment_root/$TESTSUBJECT/versions.alt/orig/$VER/$TESTSUBJECT_ALT/lib/*"
export CLASSPATH

echo " running test 1"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.analysis.CoverageBuilderTest> $experiment_root/$TESTSUBJECT/outputs/t1 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageBuilderTest $VER

echo " running test 2"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.flow.LabelFlowAnalyzerTest> $experiment_root/$TESTSUBJECT/outputs/t2 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelFlowAnalyzerTest $VER

echo " running test 3"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.JaCoCoTest> $experiment_root/$TESTSUBJECT/outputs/t3 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.JaCoCoTest $VER

echo " running test 4"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.analysis.SourceNodeImplTest> $experiment_root/$TESTSUBJECT/outputs/t4 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceNodeImplTest $VER

echo " running test 5"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.data.ExecutionDataReaderWriterTest> $experiment_root/$TESTSUBJECT/outputs/t5 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataReaderWriterTest $VER

echo " running test 6"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.test.validation.BooleanExpressionsTest> $experiment_root/$TESTSUBJECT/outputs/t6 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.BooleanExpressionsTest $VER

echo " running test 7"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.test.validation.FieldInitializationInTwoConstructorsTest> $experiment_root/$TESTSUBJECT/outputs/t7 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.FieldInitializationInTwoConstructorsTest $VER

echo " running test 8"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.analysis.ClassCoverageImplTest> $experiment_root/$TESTSUBJECT/outputs/t8 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ClassCoverageImplTest $VER

echo " running test 9"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.analysis.CounterComparatorTest> $experiment_root/$TESTSUBJECT/outputs/t9 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CounterComparatorTest $VER

echo " running test 10"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.analysis.LineImplTest> $experiment_root/$TESTSUBJECT/outputs/t10 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.LineImplTest $VER

echo " running test 11"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.analysis.NodeComparatorTest> $experiment_root/$TESTSUBJECT/outputs/t11 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.NodeComparatorTest $VER

echo " running test 12"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.runtime.URLStreamHandlerRuntimeTest> $experiment_root/$TESTSUBJECT/outputs/t12 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.URLStreamHandlerRuntimeTest $VER

echo " running test 13"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.test.validation.ExceptionsTest> $experiment_root/$TESTSUBJECT/outputs/t13 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.ExceptionsTest $VER

echo " running test 14"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.flow.MethodProbesAdapterTest> $experiment_root/$TESTSUBJECT/outputs/t14 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.MethodProbesAdapterTest $VER

echo " running test 15"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.instr.InstrumenterTest> $experiment_root/$TESTSUBJECT/outputs/t15 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.instr.InstrumenterTest $VER

echo " running test 16"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.test.validation.PrivateEmptyDefaultConstructorTest> $experiment_root/$TESTSUBJECT/outputs/t16 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.PrivateEmptyDefaultConstructorTest $VER

echo " running test 17"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.test.validation.BlocksBeforeSuperConstructorTest> $experiment_root/$TESTSUBJECT/outputs/t17 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.BlocksBeforeSuperConstructorTest $VER

echo " running test 18"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.runtime.WildcardMatcherTest> $experiment_root/$TESTSUBJECT/outputs/t18 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.WildcardMatcherTest $VER

echo " running test 19"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.runtime.LoggerRuntimeTest> $experiment_root/$TESTSUBJECT/outputs/t19 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.LoggerRuntimeTest $VER

echo " running test 20"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.data.SessionInfoTest> $experiment_root/$TESTSUBJECT/outputs/t20 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoTest $VER

echo " running test 21"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.data.ExecutionDataTest> $experiment_root/$TESTSUBJECT/outputs/t21 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataTest $VER

echo " running test 22"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.test.validation.ControlStructuresTest> $experiment_root/$TESTSUBJECT/outputs/t22 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.ControlStructuresTest $VER

echo " running test 23"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.analysis.StringPoolTest> $experiment_root/$TESTSUBJECT/outputs/t23 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.StringPoolTest $VER

echo " running test 24"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.data.CompactDataInputOutputTest> $experiment_root/$TESTSUBJECT/outputs/t24 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CompactDataInputOutputTest $VER

echo " running test 25"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.analysis.AnalyzerTest> $experiment_root/$TESTSUBJECT/outputs/t25 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.AnalyzerTest $VER

echo " running test 26"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.runtime.AgentOptionsTest> $experiment_root/$TESTSUBJECT/outputs/t26 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.AgentOptionsTest $VER

echo " running test 27"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.flow.LabelInfoTest> $experiment_root/$TESTSUBJECT/outputs/t27 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.LabelInfoTest $VER

echo " running test 28"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.runtime.SystemPropertiesRuntimeTest> $experiment_root/$TESTSUBJECT/outputs/t28 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.SystemPropertiesRuntimeTest $VER

echo " running test 29"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.data.SessionInfoStoreTest> $experiment_root/$TESTSUBJECT/outputs/t29 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.SessionInfoStoreTest $VER

echo " running test 30"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.flow.InstructionTest> $experiment_root/$TESTSUBJECT/outputs/t30 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.InstructionTest $VER

echo " running test 31"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.analysis.SourceFileCoverageImplTest> $experiment_root/$TESTSUBJECT/outputs/t31 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.SourceFileCoverageImplTest $VER

echo " running test 32"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.analysis.PackageCoverageTest> $experiment_root/$TESTSUBJECT/outputs/t32 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.PackageCoverageTest $VER

echo " running test 33"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.analysis.ContentTypeDetectorTest> $experiment_root/$TESTSUBJECT/outputs/t33 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.ContentTypeDetectorTest $VER

echo " running test 34"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.runtime.ExecutionDataAccessTest> $experiment_root/$TESTSUBJECT/outputs/t34 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ExecutionDataAccessTest $VER

echo " running test 35"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.instr.InstrSupportTest> $experiment_root/$TESTSUBJECT/outputs/t35 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.InstrSupportTest $VER

echo " running test 36"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.analysis.CounterImplTest> $experiment_root/$TESTSUBJECT/outputs/t36 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.CounterImplTest $VER

echo " running test 37"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.data.ExecutionDataStoreTest> $experiment_root/$TESTSUBJECT/outputs/t37 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.data.ExecutionDataStoreTest $VER

echo " running test 38"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.test.validation.SourceTest> $experiment_root/$TESTSUBJECT/outputs/t38 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.SourceTest $VER

echo " running test 39"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.instr.ClassInstrumenterTest> $experiment_root/$TESTSUBJECT/outputs/t39 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ClassInstrumenterTest $VER

echo " running test 40"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.analysis.CoverageNodeImplTest> $experiment_root/$TESTSUBJECT/outputs/t40 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.analysis.CoverageNodeImplTest $VER

echo " running test 41"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.instr.MethodInstrumenterTest> $experiment_root/$TESTSUBJECT/outputs/t41 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.MethodInstrumenterTest $VER

echo " running test 42"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.data.CRC64Test> $experiment_root/$TESTSUBJECT/outputs/t42 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.data.CRC64Test $VER

echo " running test 43"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.analysis.BundleCoverageImplTest> $experiment_root/$TESTSUBJECT/outputs/t43 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.BundleCoverageImplTest $VER

echo " running test 44"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.analysis.MethodCoverageImplTest> $experiment_root/$TESTSUBJECT/outputs/t44 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodCoverageImplTest $VER

echo " running test 45"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.test.validation.ImplicitFieldInitializationTest> $experiment_root/$TESTSUBJECT/outputs/t45 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.ImplicitFieldInitializationTest $VER

echo " running test 46"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.test.validation.ClassInitializerTest> $experiment_root/$TESTSUBJECT/outputs/t46 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.ClassInitializerTest $VER

echo " running test 47"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.analysis.MethodAnalyzerTest> $experiment_root/$TESTSUBJECT/outputs/t47 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.analysis.MethodAnalyzerTest $VER

echo " running test 48"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.test.validation.InterfaceClassInitializerTest> $experiment_root/$TESTSUBJECT/outputs/t48 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.InterfaceClassInitializerTest $VER

echo " running test 49"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest> $experiment_root/$TESTSUBJECT/outputs/t49 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.ModifiedSystemClassRuntimeTest $VER

echo " running test 50"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.test.validation.ImplicitDefaultConstructorTest> $experiment_root/$TESTSUBJECT/outputs/t50 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.test.validation.ImplicitDefaultConstructorTest $VER

echo " running test 51"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.flow.ClassProbesAdapterTest> $experiment_root/$TESTSUBJECT/outputs/t51 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.flow.ClassProbesAdapterTest $VER

echo " running test 52"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.runtime.RemoteControlReaderWriterTest> $experiment_root/$TESTSUBJECT/outputs/t52 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.runtime.RemoteControlReaderWriterTest $VER

echo " running test 53"
java -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES org.junit.runner.JUnitCore org.jacoco.core.internal.instr.ProbeVariableInserterTest> $experiment_root/$TESTSUBJECT/outputs/t53 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.jacoco.core.internal.instr.ProbeVariableInserterTest $VER

