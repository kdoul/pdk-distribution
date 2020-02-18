#!/bin/sh

set -e
set -u

PROJECT=$(pwd) # Yes, hack!
TARGET=$PROJECT/target

echo "--- Package wix"

mkdir -p $TARGET

rm -rf $TARGET/pkg-wix

cp -r $PROJECT/package/wix $TARGET/pkg-wix

mkdir $TARGET/pkg-wix/package
unzip -qo $TARGET/pkg/win64.zip -d $TARGET/pkg-wix/package

docker run --rm -it \
  -v $TARGET/pkg-wix:/work \
  felfert/wix \
  sh build.sh

test -e $TARGET/pkg-wix/PDK.msi

mkdir -p $TARGET/pkg
cp $TARGET/pkg-wix/PDK.msi $TARGET/pkg/win64.msi

echo
