#!/bin/sh

set -e
set -u


VERSION=${JRUBY_VERSION:-"9.2.11.1"}

mkdir -p $DIST/lib

download jruby-dist-${VERSION}-bin.zip \
  https://repo1.maven.org/maven2/org/jruby/jruby-dist/${VERSION}/jruby-dist-${VERSION}-bin.zip

test ! -e $DIST/lib/jruby || rm -rf $DIST/lib/jruby

unzip -qo $TMP/jruby-dist-${VERSION}-bin.zip -d $DIST/lib
mv $DIST/lib/jruby-${VERSION} $DIST/lib/jruby

bin=$DIST/lib/jruby/bin
$bin/jruby $bin/jgem install highline --no-document
$bin/jruby $bin/jgem install slop --no-document
$bin/jruby $bin/jgem install nokogiri --no-document
