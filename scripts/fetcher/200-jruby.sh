#!/bin/sh

set -e
set -u


VERSION=${JRUBY_VERSION:-"9.2.9.0"}

mkdir -p $DIST/common/lib

download jruby-dist-${VERSION}-bin.zip \
  https://repo1.maven.org/maven2/org/jruby/jruby-dist/${VERSION}/jruby-dist-${VERSION}-bin.zip

test ! -e $DIST/common/lib/jruby || rm -rf $DIST/common/lib/jruby

unzip -qo $TMP/jruby-dist-${VERSION}-bin.zip -d $DIST/common/lib
mv $DIST/common/lib/jruby-${VERSION} $DIST/common/lib/jruby

bin=$DIST/common/lib/jruby/bin
$bin/jruby $bin/jgem install highline
$bin/jruby $bin/jgem install slop
