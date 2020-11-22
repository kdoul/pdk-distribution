#!/bin/sh

set -e
set -u


VERSION=${SAXON_VERSION:-"9.9.1-7"}

# Download
download Saxon-HE-${VERSION}.jar \
  https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/${VERSION}/Saxon-HE-${VERSION}.jar

# Prepare folder
mkdir -p $DIST/lib/saxon

# Copy Saxon to folder
cp $TMP/Saxon-HE-${VERSION}.jar $DIST/lib/saxon/saxon.jar
