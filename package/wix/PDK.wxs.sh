#!/bin/sh

# Basics
NAME="Peppol Development Kit (PDK)"
MANUFACTURER="OpenPEPPOL AISBL"

NAME_DIR="PDK"
MANUFACTURER_DIR="Peppol"

# GUIDs
ID_PRODUCT="3d8f8ab9-86C7-4D14-AEC0-86416A69ABDE"
ID_UPGRADE="3d8f8ab9-7349-453F-94F6-BCB5110BA4FD"

# Version
VERSION=$(cat package/lib/peppol/version | cut -d '/'  -f 1)
if [ $VERSION = 'snapshot' ]; then
    VERSION="0.0.0"
fi
if [ $VERSION = 'master' ]; then
    VERSION="0.0.0"
fi

# Helpers
folder () {
    for d in $(find $1 -mindepth 1 -maxdepth 1 -type d); do
        echo "$2<Directory Id=\"d_$(echo $d | sed 's:[\-]:..:g' | sed 's:[/]:__:g' | tail -c 70)\" Name=\"$(basename $d)\">"

        for f in $(find $d -mindepth 1 -maxdepth 1 -type f); do
            if [ $(echo -n $f | wc -m ) -ge 110 ]; then
                echo "$2\t<!-- $f -->"
            else
                echo "$2\t<Component Id='c_$(echo "$f" | sed 's:[\-]:..:g' | sed 's:[/]:__:g' | tail -c 70)'>" #Guid='3d8f8ab9-6BE3-460D-A14F-75658D16550B'>"
                echo "$2\t\t<File Id=\"f_$(echo $f | sed 's:[\-]:..:g' | sed 's:[/]:__:g' | tail -c 70)\" Name=\"$(basename $f)\" DiskId=\"1\" Source=\"$f\" KeyPath=\"yes\"/>"
                echo "$2\t</Component>"
            fi
        done

        folder $d "$2\t"

        echo "$2</Directory>"
    done
}

# Wix
echo "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"
echo "<Wix xmlns=\"http://schemas.microsoft.com/wix/2006/wi\">"

# Product
echo "\t<Product Name=\"${NAME}\" Manufacturer=\"${MANUFACTURER}\" Id=\"${ID_PRODUCT}\" UpgradeCode=\"${ID_UPGRADE}\" Language=\"1033\" Codepage=\"1252\" Version=\"${VERSION}\">"

# Package
echo "\t\t<Package Id=\"*\" Keywords=\"Installer\" Description=\"${NAME} Installer\" Manufacturer=\"${MANUFACTURER}\" InstallerVersion=\"100\" Languages=\"1033\" Compressed=\"yes\" SummaryCodepage=\"1252\" />"

echo "\t\t<Media Id=\"1\" Cabinet=\"${NAME_DIR}.cab\" EmbedCab=\"yes\" DiskPrompt=\"CD-ROM #1\" />"
echo "\t\t<Property Id=\"DiskPrompt\" Value=\"${NAME} Installation [1]\" />"

echo "\t\t<Directory Id=\"TARGETDIR\" Name=\"SourceDir\">"
echo "\t\t\t<Directory Id=\"ProgramFilesFolder\" Name=\"PFiles\">"
echo "\t\t\t\t<Directory Id=\"${MANUFACTURER_DIR}\" Name=\"${MANUFACTURER_DIR}\">"
echo "\t\t\t\t\t<Directory Id=\"INSTALLDIR\" Name=\"${NAME_DIR}\">"

folder "package" "\t\t\t\t\t\t"

echo "\t\t\t\t\t</Directory>"
echo "\t\t\t\t</Directory>"
echo "\t\t\t</Directory>"
echo "\t\t</Directory>"

# /Product
echo "\t</Product>"

# /Wix
echo "</Wix>"