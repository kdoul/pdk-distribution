#!/bin/sh

VERSION="3.8.1"

mkdir -p target/tmp target/dist/win32/lib/python target/dist/win64/lib/python

if [ ! -e target/tmp/python-${VERSION}-embed-win32.zip ]; then
  wget -q https://www.python.org/ftp/python/${VERSION}/python-${VERSION}-embed-win32.zip \
    -O target/tmp/python-${VERSION}-embed-win32.zip
fi

if [ ! -e target/tmp/python-${VERSION}-embed-amd64.zip ]; then
  wget -q https://www.python.org/ftp/python/${VERSION}/python-${VERSION}-embed-amd64.zip \
    -O target/tmp/python-${VERSION}-embed-amd64.zip
fi

unzip -qo target/tmp/python-${VERSION}-embed-win32.zip -d target/dist/win32/lib/python
unzip -qo target/tmp/python-${VERSION}-embed-amd64.zip -d target/dist/win64/lib/python
