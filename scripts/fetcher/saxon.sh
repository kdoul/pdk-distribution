#!/bin/sh

VERSION=${SAXON_VERSION:-"9.9.1-6"}

mkdir -p $DIST/common/lib/saxon

download Saxon-HE-${VERSION}.jar \
  https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/${VERSION}/Saxon-HE-${VERSION}.jar

cp $TMP/Saxon-HE-${VERSION}.jar $DIST/common/lib/saxon/saxon.jar