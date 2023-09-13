#!/bin/sh

#  ci_post_clone.sh
#  LXS_556
#
#  Created by YoungJun Lee on 2023/09/11.
#

# 예) LxShield 압축 폴더를 다운로드하기 위한 wget 도구는 homebrew를 통해 다운로드 가능합니다.
brew install wget


##### 중요 ##### 반드시 “2. Xcode Cloud 환경에서 사용할 LxShield 형상 준비”에서 생성한 압축파일의 이름으로 수정합니다.
LXSHIELD_ZIP_NAME="Xcode_14.3.1_1.14.3.3"


# “2. Xcode Cloud 환경에서 사용할 LxShield 형상 준비”에서 업로드한 서버로부터 준비한 압축파일을 다운로드합니다. 아래의 코드는 wget을 통해 준비한 압축파일을 받는 예시입니다. 사용하는 환경에 맞게 코드를 작성하시길 바랍니다.
wget http://everythinghackable.com/temp_nshc/${LXSHIELD_ZIP_NAME}.zip


# 다운받은 압축파일의 압축을 해제합니다.
unzip ${LXSHIELD_ZIP_NAME}.zip


# 예) LXSHIELD_CLOUD_PATH=/Volumes/workspace/repository/ci_scripts/Xcode_14.3.1_1.14.3.3
LXSHIELD_CLOUD_PATH=`pwd`/${LXSHIELD_ZIP_NAME}


rm -rf ${LXSHIELD_CLOUD_PATH}/include/c++
ln -s /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../../usr/include/c++ ${LXSHIELD_CLOUD_PATH}/include/c++

