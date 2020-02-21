#!/bin/sh

set -e

sh PDK.wxs.sh 32 > win32.wxs
sh PDK.wxs.sh 64 > win64.wxs

candle win32.wxs
candle win64.wxs

light -sval win32.wixobj
light -sval win64.wixobj

echo "Testing installation..."
msiexec /i win32.msi /l*vx win32.log
echo "Installation finished..."
echo "Found $(find /home/wix/.wine -type f | grep PDK | wc -l) installed files."