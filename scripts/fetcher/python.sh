#!/bin/sh

VERSION=${PYTHON_VERSION:-"3.8.1"}

mkdir -p $DIST/win32/lib/python $DIST/win64/lib/python

download python-${VERSION}-embed-win32.zip \
  https://www.python.org/ftp/python/${VERSION}/python-${VERSION}-embed-win32.zip

download python-${VERSION}-embed-amd64.zip \
  https://www.python.org/ftp/python/${VERSION}/python-${VERSION}-embed-amd64.zip

unzip -qo $TMP/python-${VERSION}-embed-win32.zip -d $DIST/win32/lib/python
unzip -qo $TMP/python-${VERSION}-embed-amd64.zip -d $DIST/win64/lib/python
