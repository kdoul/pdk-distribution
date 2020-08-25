#!/bin/sh

set -e
set -u


VERSION=${ASCIIDOCTOR_VERSION:-"2.0.10"}

if [ -e $DIST/lib/jruby/bin/jruby ]; then
  bin=$DIST/lib/jruby/bin
  $bin/jruby $bin/jgem install asciidoctor -v$VERSION --no-document
  #$bin/jruby $bin/jgem install asciidoctor-pdf --no-document
  $bin/jruby $bin/jgem install coderay --no-document
else
  echo "Unable to find JRuby."
fi