#!/bin/sh

VERSION=${SCHEMATRON_VERSION:-2017-02-09}

# Create target folder
mkdir -p $DIST/common/lib/schematron

download iso-schematron-$VERSION-xslt2.zip \
  https://github.com/Schematron/schematron/releases/download/$VERSION/iso-schematron-xslt2.zip

# Unzip content
unzip -qo $TMP/iso-schematron-$VERSION-xslt2.zip -d $DIST/common/lib/schematron
