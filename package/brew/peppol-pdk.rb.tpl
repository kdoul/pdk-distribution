class PeppolPdk < Formula
  desc "Peppol Development Kit (PDK)"
  version "${VERSION}"
  homepage "https://peppol.eu/"

  url "https://github.com/${GITHUB_REPOSITORY}/releases/download/${VERSION}/pdk-macos64-${VERSION}.tar.gz"
  sha256 "${CHECKSUM}"

  depends_on "coreutils"

  bottle :unneeded

  def install
    bin.install_symlink prefix/"bin/pdk"
  end
end