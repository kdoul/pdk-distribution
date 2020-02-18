#!/bin/sh

set -e
set -u

PROJECT=$(pwd) # Yes, hack!
TARGET=$PROJECT/target

echo "--- Package deb"

mkdir -p $TARGET/pkg

rm -rf $TARGET/pkg-deb

cp -r $PROJECT/package/deb $TARGET/pkg-deb

mkdir $TARGET/pkg-deb/package
tar -zxf $TARGET/pkg/linux64.tar.gz -C $TARGET/pkg-deb/package

docker build -t ubuntu-with-fakeroot $PROJECT/package/deb

# Perform build
docker run --rm -i \
  -v $TARGET/pkg-deb:/work \
  --workdir /work \
  -u $(id -u) \
  ubuntu-with-fakeroot \
  sh build.sh

docker rmi ubuntu-with-fakeroot

test -e $TARGET/pkg-deb/debian.deb

mv $TARGET/pkg-deb/debian.deb $TARGET/pkg/linux64.deb

echo
