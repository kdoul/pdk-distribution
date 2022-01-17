#!/bin/sh

set -e
set -u


VERSION=${PDKENV_VERSION:-1.1.1}

# Download
download pdk-environment-win-amd64-${VERSION}.zip \
  https://github.com/openpeppol/pdk-environment/releases/download/v${VERSION}/pdk-environment-win-amd64-${VERSION}.zip

# Prepare folder
mkdir -p $DIST

# Unzip content
unzip -qo $TMP/pdk-environment-win-amd64-${VERSION}.zip -d $DIST