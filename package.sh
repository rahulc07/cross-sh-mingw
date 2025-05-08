#!/bin/bash
source toolchain.conf
mkdir -p /pkgs/$TARGET_CROSS/var/cache/neptune/meta-pkgs
echo "$TARGET_CROSS-binutils $TARGET_CROSS-gcc $TARGET_CROSS-mingw" > /pkgs/$TARGET_CROSS/depends
echo "$TARGET_CROSS-binutils $TARGET_CROSS-gcc $TARGET_CROSS-mingw " > /pkgs/$TARGET_CROSS/var/cache/neptune/meta-pkgs/$TARGET_CROSS
#version with gcc
echo "$CC_VER" > /pkgs/$TARGET_CROSS/version

# Add depend files

# Gcc
echo "$TARGET_CROSS-binutils $TARGET_CROSS-mingw" > /pkgs/$TARGET_CROSS-gcc/depends
echo "$CC_VER" > /pkgs/$TARGET_CROSS-gcc/version
# Binutils
echo "" > /pkgs/$TARGET_CROSS-binutils/depends
echo "$LD_VER" > /pkgs/$TARGET_CROSS-binutils/version
# mingw
echo "" > /pkgs/$TARGET_CROSS-mingw/depends
echo "$MINGW_VER" > /pkgs/$TARGET_CROSS-mingw/version

cd /pkgs
tar -cvzpf $TARGET_CROSS-gcc.tar.xz $TARGET_CROSS-gcc
tar -cvpzf $TARGET_CROSS-binutils.tar.xz $TARGET_CROSS-binutils
tar -cvpzf $TARGET_CROSS-mingw.tar.xz $TARGET_CROSS-mingw
tar -cvpzf $TARGET_CROSS.tar.xz $TARGET_CROSS
mv $TARGET_CROSS*.tar.xz /finished
