#!/bin/bash

# Exit on error
set -e 

# Source the configuration
source toolchain.conf

pkg=gcc
# Untar

cd $BUILD_DIR
tar -xvf $SOURCES_DIR/$pkg-$CC_VER.tar.xz
cd $pkg-$CC_VER

# Start the build


mkdir build
cd build

../configure --prefix=/usr --disable-shared --disable-threads --enable-languages=c,c++ --disable-multilib --target=x86_64-w64-mingw32 --with-build-sysroot=/usr/x86_64-w64-mingw32 --disable-libstdcxx --disable-libatomic


make -j$(nproc)
make DESTDIR=$LOCATION install
make DESTDIR=/pkgs/$TARGET_CROSS-$pkg install
find /pkgs/$TARGET_CROSS-$pkg/usr/bin -type f -and \( -executable \) -exec strip '{}' \;
strip /pkgs/$TARGET_CROSS-$pkg/usr/libexec/gcc/$TARGET_CROSS/12.2.0/{cc1*,collect2,lto*}
rm -r /pkgs/$TARGET_CROSS-$pkg/usr/share
# Delete the old files
cd $BUILD_DIR
rm -rf $pkg-$CC_VER
