#!/bin/sh

VERSION="9.9.1-6"

mkdir -p target/tmp target/dist/common/lib/saxon

if [ ! -e target/tmp/Saxon-HE-${VERSION}.jar ]; then
  wget -q https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/${VERSION}/Saxon-HE-${VERSION}.jar \
    -O target/tmp/Saxon-HE-${VERSION}.jar
fi

cp target/tmp/Saxon-HE-${VERSION}.jar target/dist/common/lib/saxon/saxon.jar
