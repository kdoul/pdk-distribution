#!/bin/sh

set -e
set -u


VERSION=${ANT_VERSION:-"1.10.8"}

# Download
download apache-ant-${VERSION}-bin.zip \
  https://archive.apache.org/dist/ant/binaries/apache-ant-${VERSION}-bin.zip

# Make sure ant doesn't exists
test ! -e $DIST/lib/ant || rm -rf $DIST/lib/ant

# Prepare lib folder
mkdir -p $DIST/lib

# Unzip content
unzip -qo $TMP/apache-ant-${VERSION}-bin.zip -d $DIST/lib
mv $DIST/lib/apache-ant-${VERSION} $DIST/lib/ant
