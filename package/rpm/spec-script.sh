%description
TODO...


%prep

echo "BUILDROOT = $RPM_BUILD_ROOT"
echo "PWD = $(pwd)"

mkdir -p $RPM_BUILD_ROOT/usr/lib/peppol $RPM_BUILD_ROOT/usr/bin

cp -r ../../package $RPM_BUILD_ROOT/usr/lib/peppol/pdk

ln -s /usr/lib/peppol/pdk/bin/pdk $RPM_BUILD_ROOT/usr/bin/pdk

exit


%files
%attr(0744, root, root) /usr/bin/*
%attr(0644, root, root) /usr/lib/peppol/pdk/*
%attr(0744, root, root) /usr/lib/peppol/pdk/bin/*
%attr(0744, root, root) /usr/lib/peppol/pdk/lib/*/bin/*
#%attr(0744, root, root) /usr/lib/peppol/pdk/lib/corretto/bin/*


%clean
rm -rf $RPM_BUILD_ROOT/usr
