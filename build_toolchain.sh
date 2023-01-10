#!/bin/bash
set -e

error_check() {
	if [[ ! $1 == 0 ]]; then
		echo "Error check the build directory"
		exit 1
	fi
}
source toolchain.conf

echo "Starting build for $ARCH with $LIBC, the triplet is $TARGET_CROSS"

echo "Building Binutils..."
bash toolchain_binutils.sh &> /dev/null
error_check "$?"
echo "Building mingw headers"
bash toolchain_mingw_headers.sh &> /dev/null
echo "Building GCC Stage 1..."
bash toolchain_gcc_static.sh &> /dev/null
error_check "$?"
echo "Building mingw"
bash toolchain_mingw.sh &> /dev/null
echo "Building the final stage of GCC..."
bash toolchain_gcc_final.sh &> /dev/null
error_check "$?"
echo "Run package.sh"
