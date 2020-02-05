default: clean ant python saxon schematron package

clean:
	@rm -rf target

ant:
	@sh scripts/ant.sh

python:
	@sh scripts/python.sh

saxon:
	@sh scripts/saxon.sh

schematron:
	@sh scripts/schematron.sh

package:
	@sh scripts/package.sh linux64 nix
	@sh scripts/package.sh macos64 nix
	@sh scripts/package.sh win32 win
	@sh scripts/package.sh win64 win

docker:
	@docker build -t openpeppol/pdk:dev .
