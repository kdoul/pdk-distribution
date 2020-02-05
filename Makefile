default: clean python saxon schematron package

clean:
	@rm -rf target

python:
	@sh tools/python.sh

saxon:
	@sh tools/saxon.sh

schematron:
	@sh tools/schematron.sh

package:
	@sh tools/package.sh linux64 nix
	@sh tools/package.sh macos64 nix
	@sh tools/package.sh win32 win
	@sh tools/package.sh win64 win
