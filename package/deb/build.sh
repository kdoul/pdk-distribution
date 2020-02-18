#!/bin/sh

mkdir -p debian/DEBIAN debian/usr/lib/peppol debian/usr/bin

sh control.sh > debian/DEBIAN/control

mv package debian/usr/lib/peppol/pdk
ln -s /usr/lib/peppol/pdk/bin/pdk debian/usr/bin/pdk

fakeroot dpkg-deb --build debian