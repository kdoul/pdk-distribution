#!/bin/sh

set -e
set -u

sh PDK.wxs.sh > PDK.wxs

candle PDK.wxs

light -sval PDK.wixobj
