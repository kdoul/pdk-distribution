default: clean fetch version package

clean:
	@rm -rf target

fetch:
	@sh scripts/fetch.sh

version:
	@sh scripts/version.sh

package: package-linux64 package-macos64 package-win32 package-win64 package-wix

package-linux64:
	@sh scripts/package-tar.sh linux64 nix

package-macos64:
	@sh scripts/package-tar.sh macos64 nix

package-win32:
	@sh scripts/package-zip.sh win32 win

package-win64:
	@sh scripts/package-zip.sh win64 win

package-wix:
	@sh scripts/package-wix.sh

docker:
	@docker build -t openpeppol/pdk:dev .
