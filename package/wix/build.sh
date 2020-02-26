#!/bin/sh

set -e

sh PDK.wxs.sh $1 > win$1.wxs

candle win$1.wxs

light -sval win$1.wixobj

if [ "$1" = "32" ]; then
    echo "Testing installation..."
    msiexec /i win32.msi /l*vx win32.log
    echo "Installation finished..."
    echo "Found $(find /home/wix/.wine -type f | grep PDK | wc -l) installed files."
fi