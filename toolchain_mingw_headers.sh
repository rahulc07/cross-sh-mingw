#!/bin/bash
set -e
# Source the configuration
source toolchain.conf
# For Build System Only
pkg=mingw
# Untar

cd $BUILD_DIR
tar -xvf $SOURCES_DIR/mingw-w64-v11.0.0.tar.bz2
cd mingw-w64-v11.0.0

# Start the build

cd mingw-w64-headers

./configure --prefix=/usr/$TARGET_CROSS 

make -j$JOBS

make install
# Delete the old files
cd $BUILD_DIR
rm -rf mingw-w64-v11.0.0
