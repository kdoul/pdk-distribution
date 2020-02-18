#!/bin/sh

PROJECT=$(pwd) # Yes, hack!

mkdir -p $PROJECT/target/dist/common/lib/peppol

VERSION=$(echo ${GITHUB_REF:-snapshot} | sed "s:.*/::g" | sed s:^v::)
TS=$(date -u +z%Y%m%d%H%M%S)

echo "$VERSION/$TS" > $PROJECT/target/dist/common/lib/peppol/version