#!/bin/sh

set -e
set -u


VERSION=${PDKENV_VERSION:-20210202}

# Download
download pdk-environment-win-amd64-${VERSION}.zip \
  https://github.com/k15g-openpeppol/pdk-environment/releases/download/${VERSION}/pdk-environment-win-amd64-${VERSION}.zip

# Prepare folder
mkdir -p $DIST

# Unzip content
unzip -qo $TMP/pdk-environment-win-amd64-${VERSION}.zip -d $DIST