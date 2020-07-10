PROJECT=$(shell pwd)
PATH=$(PROJECT)/src/bin:$(shell echo $$PATH)

default: prepare package

prepare: clean fetch version

clean:
	@rm -rf target

fetch: fetch-linux-amd64 fetch-macos-amd64 fetch-win32 fetch-win64

fetch-linux-amd64:
	@fetch linux-amd64 linux nix

fetch-macos-amd64:
	@fetch macos-amd64 macos nix

fetch-win32:
	@fetch win32 win

fetch-win64:
	@fetch win64 win

version:
	@version

package: package-linux-amd64 package-macos-amd64 package-win32 package-win64

package-linux-amd64: package-linux-amd64-tar package-linux-amd64-deb package-linux-amd64-rpm

package-macos-amd64: package-macos-amd64-tar package-macos-amd64-app package-macos-amd64-brew

package-win32: package-win32-zip package-win32-wix

package-win64: package-win64-zip package-win64-wix

package-linux-amd64-tar:
	@package-tar linux-amd64 linux nix

package-linux-amd64-deb:
	@package-deb

package-linux-amd64-rpm:
	@package-rpm

package-macos-amd64-tar:
	@package-tar macos-amd64 macos nix

package-macos-amd64-app:
	@package-macapp

package-macos-amd64-brew:
	@package-brew

package-win32-zip:
	@package-zip win32 win

package-win32-wix:
	@package-wix32

package-win64-zip:
	@package-zip win64 win

package-win64-wix:
	@package-wix64

docker:
	@docker build -t openpeppol/pdk:dev .
