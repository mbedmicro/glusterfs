#!/bin/bash

if [ -z "${BASH_SOURCE}" ] ; then
    SCRIPT_PATH=`readlink -f  "$0"`
    CURRENT_DIR=`pwd`
    cd `dirname ${SCRIPT_PATH}` > /dev/null
    SCRIPT_PATH=`pwd`;
    cd $CURRENT_DIR
else
    SCRIPT_PATH="${BASH_SOURCE[0]}";
    if ([ -h "${SCRIPT_PATH}" ]) then
        while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
    fi
    pushd . > /dev/null
    cd `dirname ${SCRIPT_PATH}` > /dev/null
    SCRIPT_PATH=`pwd`;
    popd  > /dev/null
fi

cd $SCRIPT_PATH
exec docker build $* -t mbed/glusterfs . 
