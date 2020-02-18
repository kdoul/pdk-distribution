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

# Removing files part of JRuby not needed on Windows.
# Removed because existence of one or more of the files crashes wix.
rm -rf $TARGET/pkg-wix/package/lib/jruby/lib/jni/arm-*
rm -rf $TARGET/pkg-wix/package/lib/jruby/lib/jni/Darwin
rm -rf $TARGET/pkg-wix/package/lib/jruby/lib/jni/*-Linux
rm -rf $TARGET/pkg-wix/package/lib/jruby/lib/jni/*-SunOS
rm -rf $TARGET/pkg-wix/package/lib/jruby/lib/jni/*AIX
rm -rf $TARGET/pkg-wix/package/lib/jruby/lib/jni/*BSD

chmod 777 $TARGET/pkg-wix

# Create PDK.wxs
docker run --rm -i \
  -v $TARGET/pkg-wix:/work \
  --workdir /work \
  felfert/wix \
  sh PDK.wxs.sh > $TARGET/pkg-wix/PDK.wxs

# Perform build
docker run --rm -i \
  -v $TARGET/pkg-wix:/work \
  --workdir /work \
  felfert/wix \
  sh build.sh

test -e $TARGET/pkg-wix/PDK.msi

mkdir -p $TARGET/pkg
cp $TARGET/pkg-wix/PDK.msi $TARGET/pkg/win64.msi

echo
