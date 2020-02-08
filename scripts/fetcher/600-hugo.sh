#!/bin/sh

VERSION=${HUGO_VERSION:-"0.64.0"}

# Linux
mkdir -p $DIST/linux64/bin

download hugo_${VERSION}_Linux-64bit.tar.gz \
  https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz

tar xzf $TMP/hugo_${VERSION}_Linux-64bit.tar.gz -C $DIST/linux64/bin hugo

# MacOS
mkdir -p $DIST/macos64/bin

download hugo_${VERSION}_macOS-64bit.tar.gz \
  https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_macOS-64bit.tar.gz

tar xzf $TMP/hugo_${VERSION}_macOS-64bit.tar.gz -C $DIST/macos64/bin hugo

# Win32
mkdir -p $DIST/win32/bin

download hugo_${VERSION}_Windows-32bit.zip \
  https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Windows-32bit.zip

unzip -qo $TMP/hugo_${VERSION}_Windows-32bit.zip hugo.exe -d $DIST/win32/bin

# Win64
mkdir -p $DIST/win64/bin

download hugo_${VERSION}_Windows-64bit.zip \
  https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Windows-64bit.zip

unzip -qo $TMP/hugo_${VERSION}_Windows-64bit.zip hugo.exe -d $DIST/win64/bin