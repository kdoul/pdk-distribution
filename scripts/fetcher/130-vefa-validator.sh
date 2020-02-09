#!/bin/sh

VERSION=${VEFA_VALIDATOR_VERSION:-2.1.0}

# Create target folder
mkdir -p $DIST/common/lib/vefa-validator

download vefa-validator-${VERSION}.zip \
  https://github.com/anskaffelser/vefa-validator/releases/download/${VERSION}/vefa-validator-${VERSION}.zip

# Unzip content
unzip -qo $TMP/vefa-validator-${VERSION}.zip -d $DIST/common/lib/vefa-validator
