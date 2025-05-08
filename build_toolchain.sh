#!/bin/bash
set -e

error_check() {
	if [[ ! $1 == 0 ]]; then
		echo "Error check the build directory"
		exit 1
	fi
}
source toolchain.conf
mkdir -p $BUILD_DIR/logs
echo "Starting build for $ARCH with $LIBC, the triplet is $TARGET_CROSS"

echo "Building Binutils..."
bash toolchain_binutils.sh &> $BUILD_DIR/logs/binutils.log
error_check "$?"
echo "Building mingw headers"
bash toolchain_mingw_headers.sh &> $BUILD_DIR/logs/mingw-headers.log
echo "Building GCC Stage 1..."
bash toolchain_gcc_static.sh &> $BUILD_DIR/logs/gcc-static.log
error_check "$?"
echo "Building mingw"
bash toolchain_mingw.sh &> $BUILD_DIR/logs/mingw.log
echo "Building the final stage of GCC..."
bash toolchain_gcc_final.sh &> $BUILD_DIR/logs/gcc-final.log
error_check "$?"
echo "Run package.sh"
