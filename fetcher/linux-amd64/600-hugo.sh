#!/bin/sh

set -e
set -u


VERSION=${HUGO_VERSION:-"0.74.2"}

# Linux
mkdir -p $DIST/lib/hugo

download hugo_${VERSION}_Linux-64bit.tar.gz \
  https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz

tar xzf $TMP/hugo_${VERSION}_Linux-64bit.tar.gz -C $DIST/lib/hugo