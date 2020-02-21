#!/bin/sh

set -e
set -u


VERSION=${XSDCHECKER_VERSION:-"1.0.3"}

mkdir -p $DIST/common/lib/xsdchecker

download xsdchecker-v${VERSION}.tar.gz \
  https://github.com/klakegg/xsdchecker/releases/download/v${VERSION}/xsdchecker-v${VERSION}.tar.gz

tar xzf $TMP/xsdchecker-v${VERSION}.tar.gz -C $DIST/common/lib/xsdchecker