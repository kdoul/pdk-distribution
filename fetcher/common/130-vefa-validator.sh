#!/bin/sh

set -e
set -u


VERSION=${VEFA_VALIDATOR_VERSION:-2.1.0}

# Create target folder
mkdir -p $DIST/lib/vefa-validator

download vefa-validator-${VERSION}.zip \
  https://github.com/anskaffelser/vefa-validator/releases/download/${VERSION}/vefa-validator-${VERSION}.zip

# Unzip content
unzip -qo $TMP/vefa-validator-${VERSION}.zip -d $DIST/lib/vefa-validator
