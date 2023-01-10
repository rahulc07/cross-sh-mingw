#!/bin/bash
set -e
# Source the configuration
source toolchain.conf

pkg=binutils
# Untar

cd $BUILD_DIR
tar -xvf $SOURCES_DIR/$pkg-$LD_VER.tar.xz
cd $pkg-$LD_VER

# Start the build

mkdir build
cd build

../configure --prefix=/usr --with-sysroot=$LOCATION/$TARGET_CROSS --disable-nls --disable-werror --target=$TARGET_CROSS

make -j$JOBS

make DESTDIR=$LOCATION install
make DESTDIR=/pkgs/$TARGET_CROSS-$pkg install
# Delete the old files
cd $BUILD_DIR
rm -rf $pkg-$LD_VER
# Remove conflicting files conflicting with the host
cd /pkgs/$TARGET_CROSS-$pkg
rm -rf usr/share/info
rm -rf usr/include
rm -rf usr/etc/gprofng.rc
rm -rf usr/lib/gprofng
# Strip 
cd /pkgs/$TARGET_CROSS-$pkg/usr/bin
for binary in $(ls .)
do
	if [[ ! "$binary" == "$TARGET_CROSS-gp-display-html" ]]
	then
		strip $binary
	fi
done
