#!/bin/bash
source toolchain.conf
mkdir -p /pkgs/$TARGET_CROSS/var/cache/mercury/meta-pkgs
echo "$TARGET_CROSS-binutils $TARGET_CROSS-gcc $TARGET_CROSS-mingw" > /pkgs/$TARGET_CROSS/depend
echo "$TARGET_CROSS-binutils $TARGET_CROSS-gcc $TARGET_CROSS-mingw " > /pkgs/$TARGET_CROSS/var/cache/mercury/meta-pkgs/$TARGET_CROSS

# Add depend files

# Gcc
echo "$TARGET_CROSS-binutils $TARGET_CROSS-mingw" > /pkgs/$TARGET_CROSS-gcc/depend
# Binutils
echo "" > /pkgs/$TARGET_CROSS-binutils/depend
# mingw
echo "" > /pkgs/$TARGET_CROSS-mingw/depend

cd /pkgs
tar -cvzpf $TARGET_CROSS-gcc.tar.xz $TARGET_CROSS-gcc
tar -cvpzf $TARGET_CROSS-binutils.tar.xz $TARGET_CROSS-binutils
tar -cvpzf $TARGET_CROSS-mingw.tar.xz $TARGET_CROSS-mingw
mv $TARGET_CROSS*.tar.xz /finished
