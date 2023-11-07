#!/usr/bin/env bash

#清理
rm -rf binutils-* build-binutils
#设置binutils版本和安装路径
export BV=binutils-2.31.1
export IN=/root/Toolchain/electron-$BV
#设置binutils版本可从https://mirrors.aliyun.com/gnu/binutils/寻找


# Build binutils
msg "正在构建binutils中"
wget https://mirrors.aliyun.com/gnu/binutils/$BV.tar.xz
tar -xf $BV.tar.xz
rm *.xz
mkdir build-binutils && cd build-binutils 


env CFLAGS=-O2 CXXFLAGS=-O2 ../$BV/configure --prefix=$IN --target=aarch64-linux-gnu --disable-compressed-debug-sections --disable-gdb --disable-werror --enable-deterministic-archives --enable-new-dtags --enable-plugins --enable-threads --quiet --with-system-zlib --disable-multilib --disable-nls --with-gnu-as --with-gnu-ld --enable-gold --enable-ld=default --with-pkgversion="Electron Binutils"

make -j8 && make install
cd ..
rm -rf build-binutils 

mkdir build-binutils && cd build-binutils

env CFLAGS=-O2 CXXFLAGS=-O2 ../$BV/configure --prefix=$IN --disable-compressed-debug-sections --disable-gdb --disable-werror --enable-deterministic-archives --enable-new-dtags --enable-plugins --enable-threads --quiet --with-system-zlib --disable-multilib --disable-nls --with-gnu-as --with-gnu-ld --program-prefix=arm-linux-gnueabi- --target=arm-linux-gnueabi --with-pkgversion="Electron Binutils"
make -j8 && make install

cd /root/Toolchain
tar -I pixz -cf electron-$BV.tar.xz electron-$BV

