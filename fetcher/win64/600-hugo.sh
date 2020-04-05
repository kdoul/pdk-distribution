#!/bin/sh

set -e
set -u


VERSION=${HUGO_VERSION:-"0.64.1"}

# Win64
mkdir -p $DIST/bin

download hugo_${VERSION}_Windows-64bit.zip \
  https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Windows-64bit.zip

unzip -qo $TMP/hugo_${VERSION}_Windows-64bit.zip hugo.exe -d $DIST/bin