#!/bin/sh

set -e
set -u

# TODO Change to OpenPeppol implementation

VERSION=${XSDCHECKER_VERSION:-"1.0.3"}

mkdir -p $DIST/lib/xsdchecker

download xsdchecker-v${VERSION}.tar.gz \
  https://github.com/klakegg/xsdchecker/releases/download/v${VERSION}/xsdchecker-v${VERSION}.tar.gz

tar xzf $TMP/xsdchecker-v${VERSION}.tar.gz -C $DIST/lib/xsdchecker