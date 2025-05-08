#!/bin/bash
set -e
# Source the configuration
source toolchain.conf
# For Build System Only
pkg=mingw
# Untar

cd $BUILD_DIR
wget https://sourceforge.net/projects/$pkg-w64/files/$pkg-w64/$pkg-w64-release/$pkg-w64-v$MINGW_VER.tar.bz2
tar -xvf $SOURCES_DIR/mingw-w64-v$MINGW_VER.tar.bz2
cd $pkg-w64-v$MINGW_VER

# Start the build

cd $pkg-w64-headers

./configure --prefix=/usr/$TARGET_CROSS 

make
make DESTDIR=/pkgs/$TARGET_CROSS-$pkg install
make install

cd ..

./configure --enable-experimental --prefix=/usr/$TARGET_CROSS --host=$TARGET_CROSS
# For some reason mingw doesn't support multiple jobs
make -j1

make DESTDIR=/pkgs/$TARGET_CROSS-$pkg install
make install

# Delete the old files
cd $BUILD_DIR
rm -rf $pkg-w64-v$MINGW_VER
