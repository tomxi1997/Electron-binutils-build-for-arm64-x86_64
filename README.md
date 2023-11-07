# Electron-binutils-build-for-arm64
Electron-binutils-build for arm64 only 

1.编译步骤
环境ubuntu 18.04 arm64

apt update && apt update -y && apt install -y git libssl-dev gcc-arm-linux-gnueabi build-essential libncurses5-dev bzip2 make gcc g++ grep bc curl bison flex openssl lzop ccache unzip zlib1g-dev texinfo file ca-certificates ccache wget cmake texinfo zlib1g-dev xz-utils libelf-dev zip libgmp-dev xz-utils libncurses-dev g++ gawk m4 libtinfo5 cpio binutils-dev libelf-dev cmake texinfo python2

2.克隆此项目

git clone https://github.com/tomxi1997/Electron-binutils-build-for-arm64.git

3.修改build-electron-binutils.sh满意后

chmod +x build-electron-binutils.sh
./build-electron-binutils.sh

