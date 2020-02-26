default: prepare package

prepare: clean fetch version

clean:
	@rm -rf target

fetch:
	@sh scripts/fetch.sh

version:
	@sh scripts/version.sh

package: package-linux package-macos package-win

package-linux: package-linux64 package-deb package-rpm

package-macos: package-macos64

package-win: package-win32 package-win64 package-wix

package-linux64:
	@sh scripts/package-tar.sh linux64 nix

package-macos64:
	@sh scripts/package-tar.sh macos64 nix

package-win32:
	@sh scripts/package-zip.sh win32 win

package-win64:
	@sh scripts/package-zip.sh win64 win

package-deb:
	@sh scripts/package-deb.sh

package-rpm:
	@sh scripts/package-rpm.sh

package-wix:
	@sh scripts/package-wix.sh

docker:
	@docker build -t openpeppol/pdk:dev .
