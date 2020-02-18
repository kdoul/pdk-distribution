#!/bin/sh

set -e
set -u

PROJECT=$(pwd) # Yes, hack!
TARGET=$PROJECT/target

echo "--- Package wix"

mkdir -p $TARGET/pkg

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

# Make sure folder is writable for non-root user in wix container.
chmod 777 $TARGET/pkg-wix

docker build -t wix-with-extras $PROJECT/package/wix

# Perform build
docker run --rm -i \
  -v $TARGET/pkg-wix:/work \
  --workdir /work \
  wix-with-extras \
  sh build.sh

docker rmi wix-with-extras

test -e $TARGET/pkg-wix/PDK.msi

mv $TARGET/pkg-wix/PDK.msi $TARGET/pkg/win64.msi

echo
