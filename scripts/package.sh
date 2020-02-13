#!/bin/sh

PROJECT=$(pwd) # Yes, hack!
TARGET=$PROJECT/target
DIST=$1
GROUP=$2

echo "--- Package $DIST"

mkdir -p $TARGET/pkg
test -e $TARGET/pkg/$DIST.zip && rm -rf $TARGET/pkg/$DIST.zip

for a in "static" "target/dist"; do
  for d in common $GROUP $DIST; do
    if [ -e $PROJECT/$a/$d ]; then
      cd $PROJECT/$a/$d

      if [ -e bin ]; then
        chmod a+x bin/*
      fi

      zip -q9r $TARGET/pkg/$DIST.zip *
      tar rf $TARGET/pkg/$DIST.tar *
    fi
  done
done

gzip -9 $TARGET/pkg/$DIST.tar

echo
