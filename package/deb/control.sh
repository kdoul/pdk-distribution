#!/bin/sh

VERSION=$(cat package/lib/peppol/version | cut -d '/'  -f 1)
TS=$(cat package/lib/peppol/version | cut -d '/'  -f 2)
if [ $VERSION = 'snapshot' ]; then
    VERSION="0.0.0"
fi
if [ $VERSION = 'master' ]; then
    VERSION="0.0.0"
fi


echo "Package: peppol-pdk"
echo "Version: ${VERSION}-${TS}"
echo "Section: base"
echo "Priority: optional"
echo "Architecture: amd64"
echo "Maintainer: Operating Office <oo@peppol.eu>"
echo "Description: Peppol Development Kit (PDK)"