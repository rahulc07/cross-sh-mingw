#!/bin/bash

# Remember to edit the toolchain.conf file BEFORE using this script
set -e

if [[ ! -f toolchain.conf ]]; then
	echo "FATAL: toolchain.conf file not found! Are you in the right directory?"	
        exit 1
fi

source toolchain.conf
mkdir -p $SOURCES_DIR
mkdir -p $BUILD_DIR
