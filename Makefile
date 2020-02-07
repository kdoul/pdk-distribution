default: clean fetch package

clean:
	@rm -rf target

fetch:
	@sh scripts/fetch.sh

package:
	@sh scripts/package.sh linux64 nix
	@sh scripts/package.sh macos64 nix
	@sh scripts/package.sh win32 win
	@sh scripts/package.sh win64 win

docker:
	@docker build -t openpeppol/pdk:dev .
