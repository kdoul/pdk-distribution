#!/bin/sh

set -e
set -u


# linux64
mkdir -p $DIST/linux64/lib/corretto

download amazon-corretto-8-x64-linux-jdk.tar.gz \
  https://corretto.aws/downloads/latest/amazon-corretto-8-x64-linux-jdk.tar.gz

tar -zxf $TMP/amazon-corretto-8-x64-linux-jdk.tar.gz --strip 1 -C $DIST/linux64/lib/corretto


# maxos64
mkdir -p $DIST/macos64/lib/corretto

download amazon-corretto-8-x64-macos-jdk.tar.gz \
  https://corretto.aws/downloads/latest/amazon-corretto-8-x64-macos-jdk.tar.gz

tar -zxf $TMP/amazon-corretto-8-x64-macos-jdk.tar.gz --strip 1 -C $DIST/macos64/lib/corretto


# win32
mkdir -p $DIST/win32/lib

download amazon-corretto-8-x86-windows-jre.zip \
  https://corretto.aws/downloads/latest/amazon-corretto-8-x86-windows-jre.zip

test ! -e $DIST/win32/lib/corretto || rm -rf $DIST/win32/lib/corretto

unzip -qo $TMP/amazon-corretto-8-x86-windows-jre.zip -d $DIST/win32/lib
mv $DIST/win32/lib/jre8 $DIST/win32/lib/corretto


# win64
mkdir -p $DIST/win64/lib

download amazon-corretto-8-x64-windows-jre.zip \
  https://corretto.aws/downloads/latest/amazon-corretto-8-x64-windows-jre.zip

test ! -e $DIST/win64/lib/corretto || rm -rf $DIST/win64/lib/corretto

unzip -qo $TMP/amazon-corretto-8-x64-windows-jre.zip -d $DIST/win64/lib
mv $DIST/win64/lib/jre8 $DIST/win64/lib/corretto