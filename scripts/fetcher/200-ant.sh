#!/bin/sh

VERSION=${ANT_VERSION:-"1.10.7"}

mkdir -p $DIST/common/lib

download apache-ant-${VERSION}-bin.zip \
  http://apache.uib.no/ant/binaries/apache-ant-${VERSION}-bin.zip

test ! -e $DIST/common/lib/ant || rm -rf $DIST/common/lib/ant

unzip -qo $TMP/apache-ant-${VERSION}-bin.zip -d $DIST/common/lib
mv $DIST/common/lib/apache-ant-${VERSION} $DIST/common/lib/ant
