#!/bin/sh

set -e
set -u


# Install
bin=$DIST/lib/jruby/bin
$bin/jruby $bin/jgem install \
  --no-document \
  --source "https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@rubygems.pkg.github.com/k15g-openpeppol" \
  pdk-utils
