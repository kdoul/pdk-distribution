#!/bin/sh

echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'
echo '<plist version="1.0">'
echo '<dict>'
echo '\t<key>CFBundleGetInfoString</key>'
echo '\t<string>PDK</string>'
echo '\t<key>CFBundleExecutable</key>'
echo '\t<string>bin/pdk</string>'
echo '\t<key>CFBundleIdentifier</key>'
echo '\t<string>org.peppol.pdk</string>'
echo '\t<key>CFBundleName</key>'
echo '\t<string>PDK</string>'
echo '\t<key>CFBundleIconFile</key>'
echo '\t<string>foo.icns</string>'
echo '\t<key>CFBundleShortVersionString</key>'
echo '\t<string>0.01</string>'
echo '\t<key>CFBundleInfoDictionaryVersion</key>'
echo '\t<string>6.0</string>'
echo '\t<key>CFBundlePackageType</key>'
echo '\t<string>APPL</string>'
echo '\t<key>IFMajorVersion</key>'
echo '\t<integer>0</integer>'
echo '\t<key>IFMinorVersion</key>'
echo '\t<integer>1</integer>'
echo '</dict>'
echo '</plist>'