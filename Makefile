PROJECT=$(shell pwd)
PATH=$(PROJECT)/src/bin:$(shell echo $$PATH)

default: prepare package

prepare: clean fetch version

clean:
	@rm -rf target

fetch: fetch-linux-amd64 fetch-macos-amd64 fetch-win-amd64

fetch-linux-amd64:
	@fetch linux-amd64 linux nix

fetch-linux-arm64:
	@fetch linux-arm64 linux nix

fetch-macos-amd64:
	@fetch macos-amd64 macos nix

fetch-win-amd64:
	@fetch win-amd64 win

version:
	@version

package: package-linux-amd64 package-macos-amd64 package-win-amd64

package-linux-amd64: package-linux-amd64-tar package-linux-amd64-deb package-linux-amd64-rpm

package-linux-arm64: package-linux-arm64-tar

package-macos-amd64: package-macos-amd64-tar package-macos-amd64-app package-macos-amd64-brew

package-win-amd64: package-win-amd64-zip package-win-amd64-wix

package-linux-amd64-tar:
	@package-tar linux-amd64 linux nix

package-linux-arm64-tar:
	@package-tar linux-arm64 linux nix

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

package-win-amd64-zip:
	@package-zip win-amd64 win

package-win-amd64-wix:
	@package-wix64

docker-build:
	@DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build \
		--progress plain \
		--platform linux/arm64,linux/amd64 \
		--tag openpeppol/pdk:dev \
		.

docker-push:
	@DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build \
		--progress plain \
		--platform linux/arm64,linux/amd64 \
		--tag $(tag) \
		--push \
		.

linux-amd64: fetch-linux-amd64 version package-linux-amd64-tar package-linux-amd64-deb package-linux-amd64-rpm
linux-arm64: fetch-linux-arm64 version package-linux-arm64-tar
macos-amd64: fetch-macos-amd64 version package-macos-amd64-tar