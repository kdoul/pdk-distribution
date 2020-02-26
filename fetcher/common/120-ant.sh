#!/bin/sh

set -e
set -u


VERSION=${ANT_VERSION:-"1.10.7"}

mkdir -p $DIST/lib

download apache-ant-${VERSION}-bin.zip \
  http://apache.uib.no/ant/binaries/apache-ant-${VERSION}-bin.zip

test ! -e $DIST/lib/ant || rm -rf $DIST/lib/ant

unzip -qo $TMP/apache-ant-${VERSION}-bin.zip -d $DIST/lib
mv $DIST/lib/apache-ant-${VERSION} $DIST/lib/ant
