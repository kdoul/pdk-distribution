#!/bin/sh

set -e
set -u

PROJECT=$(pwd) # Yes, hack!
TARGET=$PROJECT/target

echo "--- Package app"

# Clean
test -e $TARGET/pkg/macos64.app.tar.gz && rm -rf $TARGET/macos64.app.tar.gz
test -e $TARGET/pkg-macapp && $TARGET/pkg-macapp

# Prepare folders
mkdir -p \
    $TARGET/pkg \
    $TARGET/pkg-macapp/pdk.app/Contents/Home \
    $TARGET/pkg-macapp/pdk.app/Contents/MacOS

# Generate Info.plist
sh $PROJECT/package/macapp/Info.plist.sh > $TARGET/pkg-macapp/pdk.app/Contents/Info.plist

# Extract project
touch $TARGET/pkg-macapp/pdk.app/Contents/MacOS/libjli.dylib
tar -zxf $TARGET/pkg/macos64.tar.gz -C $TARGET/pkg-macapp/pdk.app/Contents/Home

# Package
cd $TARGET/pkg-macapp/
tar -czf $TARGET/pkg/macos64.app.tar.gz *

echo