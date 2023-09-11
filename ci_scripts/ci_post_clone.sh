#!/bin/sh

#  ci_post_clone.sh
#  LXS_556
#
#  Created by YoungJun Lee on 2023/09/11.
#  

brew install wget

mkdir LxShield
cd LxShield

LXSHIELD_ZIP_NAME="Xcode1431_Test_14.3.1_1.14.3.3"
LXSHIELD_CLOUD_PATH=`pwd`/LxShield/${LXSHIELD_ZIP_NAME}

wget http://everythinghackable.com/temp_nshc/${LXSHIELD_ZIP_NAME}.zip
unzip ${LXSHIELD_ZIP_NAME}.zip

rm -rf ${LXSHIELD_CLOUD_PATH}/include/c++
ln -s /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../../usr/include/c++ ${LXSHIELD_CLOUD_PATH}/include/c++

#rm -rf ${LXSHIELD_CLOUD_PATH}/lib/swift/clang
#ln -s ${LXSHIELD_CLOUD_PATH}/lib/clang/15.0.0 ${LXSHIELD_CLOUD_PATH}/lib/swift/clang

ls -al
