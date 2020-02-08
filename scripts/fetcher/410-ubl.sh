#!/bin/sh

VERSION=${UBL_VERSION:-"2.2"}

mkdir -p $DIST/common/lib/ubl

download UBL-${VERSION}.zip \
  http://docs.oasis-open.org/ubl/os-UBL-${VERSION}/UBL-${VERSION}.zip

unzip -qo $TMP/UBL-${VERSION}.zip -d $DIST/common/lib/ubl