#!/bin/sh

set -e
set -u

PROJECT=$(pwd) # Yes, hack!
TARGET=$PROJECT/target

echo "--- Package brew"

# Clean
test -e $TARGET/pkg/macos64.brew.rb && rm -rf $TARGET/pkg/macos64.brew.rb

# Calculate checksum for package
export CHECKSUM=$(sha256sum $TARGET/pkg/macos64.tar.gz | cut -d ' ' -f 1)

# Fetch version
export VERSION=$(cat $TARGET/dist/common/lib/peppol/version | cut -d '/'  -f 1)
if [ $VERSION = 'snapshot' ]; then
    export VERSION="0.0.0"
elif [ $VERSION = 'master' ]; then
    export VERSION="0.0.0"
fi

# Make sure repository is present
export GITHUB_REPOSITORY=${GITHUB_REPOSITORY:-OpenPEPPOL/pdk}

# Create file
envsubst < $PROJECT/package/brew/peppol-pdk.rb.tpl > $TARGET/pkg/peppol-pdk.rb

echo