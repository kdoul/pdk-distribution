#!/bin/sh

# Create target folder
mkdir -p target/tmp target/dist/common/lib/schematron

# Download
if [ ! -e target/tmp/iso-schematron-xslt2.zip ]; then
  wget -q https://github.com/Schematron/schematron/releases/download/2017-02-09/iso-schematron-xslt2.zip \
    -O target/tmp/iso-schematron-xslt2.zip
fi

# Unzip content
unzip -qo target/tmp/iso-schematron-xslt2.zip -d target/dist/common/lib/schematron
