#!/bin/sh

set -e
set -u


VERSION=${PDKENV_VERSION:-20210502}

# Download
download pdk-environment-macos-amd64-${VERSION}.tar.gz \
  https://github.com/k15g-openpeppol/pdk-environment/releases/download/${VERSION}/pdk-environment-macos-amd64-${VERSION}.tar.gz

# Prepare folder
mkdir -p $DIST

# Unzip content
tar -zxf $TMP/pdk-environment-macos-amd64-${VERSION}.tar.gz -C $DIST
