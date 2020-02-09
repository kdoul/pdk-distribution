#!/bin/sh

VERSION=${ASCIIDOCTOR_VERSION:-"2.0.10"}

if [ -e $DIST/common/lib/jruby/bin/jruby ]; then
  bin=$DIST/common/lib/jruby/bin
  $bin/jruby $bin/jgem install asciidoctor -v$VERSION
  $bin/jruby $bin/jgem install coderay
else
  echo "Unable to find JRuby."
fi