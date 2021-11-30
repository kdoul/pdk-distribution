#!/bin/sh

set -e
set -u


VERSION=${PDKENV_VERSION:-1.0.0}

# Download
download pdk-environment-linux-arm64-${VERSION}.tar.gz \
  https://github.com/OpenPEPPOL/pdk-environment/releases/download/v${VERSION}/pdk-environment-linux-arm64-${VERSION}.tar.gz

# Prepare folder
mkdir -p $DIST

# Unzip content
tar -zxf $TMP/pdk-environment-linux-arm64-${VERSION}.tar.gz -C $DIST
