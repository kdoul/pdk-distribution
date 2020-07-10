#!/bin/sh

set -e
set -u


# linux64
mkdir -p $DIST/lib/corretto

download amazon-corretto-8-x64-linux-jdk.tar.gz \
  https://corretto.aws/downloads/latest/amazon-corretto-8-x64-linux-jdk.tar.gz

tar -zxf $TMP/amazon-corretto-8-x64-linux-jdk.tar.gz --strip 1 -C $DIST/lib/corretto
