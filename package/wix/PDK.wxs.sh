#!/bin/sh

set -e
set -u

# Basics
NAME="Peppol Development Kit (PDK)"
MANUFACTURER="OpenPEPPOL AISBL"

NAME_DIR="PDK"
MANUFACTURER_DIR="Peppol"

# GUIDs
ID_UPGRADE_64="1FC690D3-4526-4A54-A989-763F64B1E2F7"
ID_UPGRADE_32="7872F398-1746-4DD0-8F01-831B718B6F63"

if [ $1 = "64" ]; then
    ID_UPGRADE=$ID_UPGRADE_64
else
    ID_UPGRADE=$ID_UPGRADE_32
fi

# Version
FULL_VERSION=$(cat package${1}/lib/peppol/version)
VERSION=$(echo $FULL_VERSION | cut -d '/'  -f 1)
if [ $VERSION = 'snapshot' ]; then
    VERSION="0.0.0"
fi
if [ $VERSION = 'master' ]; then
    VERSION="0.0.0"
fi

# Helpers
idfy () {
    echo -n $1 | sed 's:[\-]:..:g' | sed 's:[/]:__:g' | tail -c 70
}

folder () {
    for d in $(find $1 -mindepth 1 -maxdepth 1 -type d); do
        echo "$2<Directory Id=\"d_$(idfy $d)\" Name=\"$(basename $d)\">"

        for f in $(find $d -mindepth 1 -maxdepth 1 -type f); do
            source=$f

            if [ $(echo -n $f | wc -m ) -ge 110 ]; then
                source="tl/$(idfy $f)"
                mkdir -p $(dirname $source)
                cp $f $source
            fi

            echo "$2\t<Component Id=\"c_$(idfy $f)\" Guid=\"*\">"
            echo "$2\t\t<File Id=\"f_$(idfy $f)\" Source=\"$source\" Name=\"$(basename $f)\" KeyPath=\"yes\" Vital=\"yes\"/>"
            echo "$2\t</Component>"
        done

        folder $d "$2\t"

        echo "$2</Directory>"
    done
}

components () {
    for d in $(find $1 -mindepth 1 -maxdepth 1 -type d); do
        for f in $(find $d -mindepth 1 -maxdepth 1 -type f); do
            echo "\t\t\t<ComponentRef Id=\"c_$(idfy $f)\"/>"
        done

        components $d
    done
}

# Wix
echo "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"
echo "<Wix xmlns=\"http://schemas.microsoft.com/wix/2006/wi\">"

# Product
echo "\t<Product Name=\"${NAME} ${1}-bit\" Manufacturer=\"${MANUFACTURER}\" Id=\"*\" UpgradeCode=\"${ID_UPGRADE}\" Language=\"1033\" Codepage=\"1252\" Version=\"${VERSION}\">"

# Package
if [ $1 = "64" ]; then
    echo "\t\t<Package Id=\"*\" Keywords=\"Installer\" Description=\"${NAME} Installer\" Manufacturer=\"${MANUFACTURER}\" Comments=\"${FULL_VERSION}\" InstallerVersion=\"200\" Languages=\"1033\" Compressed=\"yes\" SummaryCodepage=\"1252\" Platform=\"x64\"/>"
else
    echo "\t\t<Package Id=\"*\" Keywords=\"Installer\" Description=\"${NAME} Installer\" Manufacturer=\"${MANUFACTURER}\" Comments=\"${FULL_VERSION}\" InstallerVersion=\"200\" Languages=\"1033\" Compressed=\"yes\" SummaryCodepage=\"1252\"/>"
fi

echo "\t\t<Media Id=\"1\" Cabinet=\"${NAME_DIR}.cab\" EmbedCab=\"yes\" DiskPrompt=\"CD-ROM #1\" />"
echo "\t\t<Property Id=\"DiskPrompt\" Value=\"${NAME} Installation [1]\" />"

echo "\t\t<Directory Id=\"TARGETDIR\" Name=\"SourceDir\">"

if [ $1 = "64" ]; then
    echo "\t\t\t<Directory Id=\"ProgramFiles64Folder\" Name=\"PFFolder\">"
else
    echo "\t\t\t<Directory Id=\"ProgramFilesFolder\" Name=\"PFFolder\">"
fi

echo "\t\t\t\t<Directory Id=\"${MANUFACTURER_DIR}\" Name=\"${MANUFACTURER_DIR}\">"
echo "\t\t\t\t\t<Directory Id=\"INSTALLDIR\" Name=\"${NAME_DIR}\">"

echo "\t\t\t\t\t\t<Component Id=\"PathComponent\" Guid=\"2A46D0F6-5396-470D-8A90-3470A87C9B93\" KeyPath=\"yes\">"
echo "\t\t\t\t\t\t\t<CreateFolder />"
echo "\t\t\t\t\t\t\t<Environment Id=\"PDK_PATH\" Name=\"PDK_PATH\" Value=\"[INSTALLDIR]\" Permanent=\"no\" Action=\"set\" System=\"yes\" />"
echo "\t\t\t\t\t\t\t<Environment Id=\"PATH\" Name=\"PATH\" Value=\"%PDK_PATH%\\\\bin\" Permanent=\"no\" Part=\"last\" Action=\"set\" System=\"yes\" />"
echo "\t\t\t\t\t\t</Component>"

folder "package${1}" "\t\t\t\t\t\t"

echo "\t\t\t\t\t</Directory>"
echo "\t\t\t\t</Directory>"
echo "\t\t\t</Directory>"
echo "\t\t</Directory>"

echo "\t\t<Feature Id=\"MainProduct\" Title=\"Main Product\" Level=\"1\">"

components "package${1}"

echo "\t\t\t<ComponentRef Id=\"PathComponent\"/>"
echo "\t\t</Feature>"

#echo "\t\t<UIRef Id=\"WixUI_Minimal\"/>"

# /Product
echo "\t</Product>"

# /Wix
echo "</Wix>"