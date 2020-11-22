#!/bin/sh

set -e
set -u

# TODO Fix for all platforms

mkdir -p $DIST/lib

curl -sLJ \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H 'Accept: application/octet-stream' \
    https://api.github.com/repos/k15g-openpeppol/importer/releases/assets/23169515 \
    -o $DIST/lib/importer

chmod a+x $DIST/lib/importer