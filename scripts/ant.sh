#!/bin/sh

VERSION="1.10.7"

mkdir -p target/tmp target/dist/common/lib

if [ ! -e target/tmp/apache-ant-${VERSION}-bin.zip ]; then
  wget -q http://apache.uib.no/ant/binaries/apache-ant-${VERSION}-bin.zip \
    -O target/tmp/apache-ant-${VERSION}-bin.zip
fi

test ! -e target/dist/common/lib/ant || rm -rf target/dist/common/lib/ant

unzip -qo target/tmp/apache-ant-${VERSION}-bin.zip -d target/dist/common/lib
mv target/dist/common/lib/apache-ant-1.10.7 target/dist/common/lib/ant
