#!/bin/sh

HOME=/work
echo "Home: $HOME"

# Create RPM folders
mkdir -p rpmbuild/RPMS/X86_64 rpmbuild/SOURCES rpmbuild/SPECS rpmbuild/SRPMS

# Create spec file
sh spec.sh > rpmbuild/SPECS/pdk.spec
cat spec-script.sh >> rpmbuild/SPECS/pdk.spec

# Build
rpmbuild --target X86_64 -bb rpmbuild/SPECS/pdk.spec

mv $(find rpmbuild/RPMS/ -name *.rpm | head -1) linux64.rpm
