default: prepare package

prepare: clean fetch version

clean:
	@rm -rf target

fetch: fetch-linux64 fetch-macos64 fetch-win32 fetch-win64

fetch-linux64:
	@sh scripts/fetch.sh linux64 nix

fetch-macos64:
	@sh scripts/fetch.sh macos64 nix

fetch-win32:
	@sh scripts/fetch.sh win32 win

fetch-win64:
	@sh scripts/fetch.sh win64 win

version:
	@sh scripts/version.sh

package: package-linux64 package-macos64 package-win32 package-win64

package-linux64: package-linux64-zip package-linux64-deb package-linux64-rpm

package-macos64: package-macos64-zip package-macos64-app package-macos64-brew

package-win32: package-win32-zip package-win32-wix

package-win64: package-win64-zip package-win64-wix

package-linux64-zip:
	@sh scripts/package-tar.sh linux64 nix

package-linux64-deb:
	@sh scripts/package-deb.sh

package-linux64-rpm:
	@sh scripts/package-rpm.sh

package-macos64-zip:
	@sh scripts/package-tar.sh macos64 nix

package-macos64-app:
	@sh scripts/package-macapp.sh

package-macos64-brew:
	@sh scripts/package-brew.sh

package-win32-zip:
	@sh scripts/package-zip.sh win32 win

package-win32-wix:
	@sh scripts/package-wix32.sh

package-win64-zip:
	@sh scripts/package-zip.sh win64 win

package-win64-wix:
	@sh scripts/package-wix64.sh

docker:
	@docker build -t openpeppol/pdk:dev .
