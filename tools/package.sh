#!/bin/sh

TARGET=$(pwd)/target
DIST=$1
GROUP=$1

mkdir -p $TARGET/pkg

for d in common $DIST $GROUP; do
  if [ -e $TARGET/dist/$d ]; then
    cd $TARGET/dist/$d
    zip -q9r $TARGET/pkg/$DIST.zip *
  fi
done
