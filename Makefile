default: clean fetch package

clean:
	@rm -rf target

fetch:
	@sh scripts/fetch.sh

package: package-linux64 package-macos64 package-win32 package-win64

package-linux64:
	@sh scripts/package.sh linux64 nix

package-macos64:
	@sh scripts/package.sh macos64 nix

package-win32:
	@sh scripts/package.sh win32 win

package-win64:
	@sh scripts/package.sh win64 win

docker:
	@docker build -t openpeppol/pdk:dev .
