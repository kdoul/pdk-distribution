#!/bin/sh

set -e
set -u


VERSION=${VEFA_STRUCTURE_VERSION:-0.7}

# Create target folder
mkdir -p $DIST/lib/vefa-structure

download vefa-structure-${VERSION}.zip \
  https://github.com/anskaffelser/vefa-structure/releases/download/v${VERSION}/vefa-structure-${VERSION}.zip

# Unzip content
unzip -qo $TMP/vefa-structure-${VERSION}.zip -d $DIST/lib/vefa-structure