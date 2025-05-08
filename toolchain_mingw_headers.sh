#!/bin/bash
set -e
# Source the configuration
source toolchain.conf
# For Build System Only
pkg=mingw
# Untar

cd $BUILD_DIR
wget https://sourceforge.net/projects/$pkg-w64/files/$pkg-w64/$pkg-w64-release/$pkg-w64-v$MINGW_VER.tar.bz2
tar -xvf $BUILD_DIR/$pkg-w64-v$MINGW_VER.tar.bz2
cd $pkg-w64-v$MINGW_VER

# Start the build

cd $pkg-w64-headers

./configure --prefix=/usr/$TARGET_CROSS 

make -j$JOBS

make install
# Delete the old files
cd $BUILD_DIR
rm -rf $pkg-w64-v$MINGW_VER
