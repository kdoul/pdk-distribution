#!/bin/sh

VERSION=$(cat package/lib/peppol/version | cut -d '/'  -f 1)
TS=$(cat package/lib/peppol/version | cut -d '/'  -f 2)
if [ $VERSION = 'snapshot' ]; then
    VERSION="0.0.0"
fi
if [ $VERSION = 'master' ]; then
    VERSION="0.0.0"
fi


echo "Summary: Peppol Development Kit (PDK)"
echo "Name: peppol-pdk"
echo "Version: ${VERSION}"
echo "Release: $(date +%s)"
echo "License: TODO"
echo "URL: http://www.peppol.eu/"
echo "Group: System"
echo "AutoReqProv: no"
echo "Packager: OpenPEPPOL AISBL"
echo "BuildRoot: /work/rpmbuild"