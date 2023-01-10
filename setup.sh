#!/bin/bash

# Remember to edit the toolchain.conf file BEFORE using this script
set -e

if [[ ! -f toolchain.conf ]]; then
	echo "FATAL: toolchain.conf file not found! Are you in the right directory?"	
        exit 1
fi
echo "EDIT THE TOOLCHAIN.CONF BEFORE RUNNING THIS SCRIPT!!!!"
sleep 10

source toolchain.conf
echo "Using wget to get the files"
mkdir -p $SOURCES_DIR
mkdir -p $BUILD_DIR
wget --input-file=wget --continue --directory-prefix=$SOURCES_DIR
