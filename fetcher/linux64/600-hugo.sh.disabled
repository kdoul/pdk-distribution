#!/bin/sh

set -e
set -u


VERSION=${HUGO_VERSION:-"0.64.1"}

# Linux
mkdir -p $DIST/bin

download hugo_${VERSION}_Linux-64bit.tar.gz \
  https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz

tar xzf $TMP/hugo_${VERSION}_Linux-64bit.tar.gz -C $DIST/bin hugo