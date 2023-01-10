#!/bin/bash
source toolchain.conf
mkdir -p /pkgs/$TARGET_CROSS/var/cache/mercury/meta-pkgs
echo "$TARGET_CROSS-binutils $TARGET_CROSS-gcc $TARGET_CROSS-glibc $TARGET_CROSS-linux-api-headers" > /pkgs/$TARGET_CROSS/depend
echo "$TARGET_CROSS-binutils $TARGET_CROSS-gcc $TARGET_CROSS-glibc $TARGET_CROSS-linux-api-headers" > /pkgs/$TARGET_CROSS/var/cache/mercury/meta-pkgs/$TARGET_CROSS
cd /pkgs
tar -cvzpf $TARGET_CROSS-gcc.tar.xz $TARGET_CROSS-gcc
tar -cvpzf $TARGET_CROSS-binutils.tar.xz $TARGET_CROSS-binutils
tar -cvpzf $TARGET_CROSS-mingw.tar.xz $TARGET_CROSS-mingw
mv $TARGET_CROSS*.tar.xz /finished
