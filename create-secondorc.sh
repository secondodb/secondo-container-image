#!/bin/bash

export COMPILE_WORKDIR=/database

# select platform
if [ "$1" == "-onlyrc" ]; then
  onlyrc=TRUE
fi

PLVER=$(swipl --version | awk {'print $3'})

echo 'export COMPILE_WORKDIR=/database' >$COMPILE_WORKDIR/.secondorc
echo 'if [ "$1" == "" ]; then' >>$COMPILE_WORKDIR/.secondorc
echo '  SEC_DIR=$COMPILE_WORKDIR/secondo' >>$COMPILE_WORKDIR/.secondorc
echo 'else' >>$COMPILE_WORKDIR/.secondorc
echo '  SEC_DIR=$1' >>$COMPILE_WORKDIR/.secondorc
echo 'fi' >>$COMPILE_WORKDIR/.secondorc
echo '' >>$COMPILE_WORKDIR/.secondorc
echo 'export SECONDO_PLATFORM=linux64' >>$COMPILE_WORKDIR/.secondorc
echo 'export SECONDO_BUILD_DIR=$SEC_DIR' >>$COMPILE_WORKDIR/.secondorc
echo 'export BERKELEY_DB_LIB="db_cxx"' >>$COMPILE_WORKDIR/.secondorc
echo 'export BERKELEY_DB_DIR=/usr' >>$COMPILE_WORKDIR/.secondorc
echo 'export J2SDK_ROOT=/usr/lib/jvm/java-8-openjdk-amd64/' >>$COMPILE_WORKDIR/.secondorc
echo 'export SWI_HOME_DIR=/usr/lib/swi-prolog' >>$COMPILE_WORKDIR/.secondorc
    if [ -f "/usr/lib/swi-prolog/lib/x86_64/libjpl.so" ]; then
echo 'export PL_LIB_DIR=$SWI_HOME_DIR/lib/x86_64/' >>$COMPILE_WORKDIR/.secondorc
    else
echo 'export PL_LIB_DIR=$SWI_HOME_DIR/lib/amd64/' >>$COMPILE_WORKDIR/.secondorc
    fi
echo 'export PL_DLL_DIR=$PL_LIB_DIR' >> $COMPILE_WORKDIR/.secondorc
echo 'export PL_INCLUDE_DIR=$SWI_HOME_DIR/include' >>$COMPILE_WORKDIR/.secondorc
echo 'export PL_VERSION=70203' >>$COMPILE_WORKDIR/.secondorc
echo 'export JPL_DLL=$PL_LIB_DIR/libjpl.so' >>$COMPILE_WORKDIR/.secondorc
echo 'export JPL_JAR=$SWI_HOME_DIR/lib/jpl.jar' >>$COMPILE_WORKDIR/.secondorc
echo 'export readline=true' >>$COMPILE_WORKDIR/.secondorc
echo 'export PATH=$PATH:.:$SECONDO_BUILD_DIR/Tools/pd' >>$COMPILE_WORKDIR/.secondorc
echo 'export SECONDO_CONFIG=$SECONDO_BUILD_DIR/bin/SecondoConfig.ini' >>$COMPILE_WORKDIR/.secondorc
echo 'export JAVAVER="1.8"' >>$COMPILE_WORKDIR/.secondorc
echo 'export PD_HEADER=$SECONDO_BUILD_DIR/Tools/pd/pd_header_listing' >>$COMPILE_WORKDIR/.secondorc
echo 'export PD_DVI_VIEWER=/usr/bin/okular' >>$COMPILE_WORKDIR/.secondorc
echo 'export PD_PS_VIEWER=/usr/bin/evince' >>$COMPILE_WORKDIR/.secondorc
echo '' >>$COMPILE_WORKDIR/.secondorc
echo 'export LD_LIBRARY_PATH=$BERKELEY_DB_DIR/lib:$SWI_HOME_DIR/lib:$PL_LIB_DIR' >>$COMPILE_WORKDIR/.secondorc
echo '' >>$COMPILE_WORKDIR/.secondorc
echo 'alias secroot='export SECONDO_BUILD_DIR=$PWD'' >>$COMPILE_WORKDIR/.secondorc
echo '' >>$COMPILE_WORKDIR/.secondorc
echo 'export PL_LIB=swipl' >>$COMPILE_WORKDIR/.secondorc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PL_LIB_DIR' >>$COMPILE_WORKDIR/.secondorc
echo 'export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"' >>$COMPILE_WORKDIR/.secondorc

#