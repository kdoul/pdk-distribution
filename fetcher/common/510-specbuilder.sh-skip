#!/bin/sh

set -e
set -u

# TODO Download public edition

VERSION="master"

mkdir -p $DIST/lib/specbuilder-tmp

    #-H 'Accept: application/octet-stream' \
curl -sLJ \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3.raw" \
    https://api.github.com/repos/k15g-openpeppol/specbuilder/tarball/${VERSION} \
    -o $TMP/specbuilder-${VERSION}.tar.gz

tar -zxf $TMP/specbuilder-${VERSION}.tar.gz --strip 1 -C $DIST/lib/specbuilder-tmp
#unzip -qo $TMP/specbuilder-${VERSION}.zip -d $DIST/lib/specbuilder-tmp
mv $DIST/lib/specbuilder-tmp/src $DIST/lib/specbuilder
rm -rf $DIST/lib/specbuilder-tmp
