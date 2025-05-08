#!/bin/bash
set -e
# Source the configuration
source toolchain.conf
# For build system only
pkg=gcc
# Untar

cd $BUILD_DIR
wget https://ftp.gnu.org/gnu/$pkg/$pkg-$CC_VER/$pkg-$CC_VER.tar.xz
tar -xvf $BUILD_DIR/$pkg-$CC_VER.tar.xz
cd $pkg-$CC_VER

# Start the build


mkdir build
cd build

../configure --prefix=/usr --disable-threads --disable-shared --enable-languages=c,c++ --disable-multilib --target=$TARGET_CROSS

make all-gcc -j$JOBS

make install-gcc

# Delete the old files
cd $BUILD_DIR
rm -rf $pkg-$CC_VER
