class Star < Formula
  desc "Star programming language compiler"
  homepage "https://josedavd-07.github.io/star-web-page/"
  url "https://github.com/josedavd-07/Star/releases/latest/download/star-language-v1.0.0-macos.tar.gz"
  # Note: Update version and SHA256 per release
  version "1.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  def install
    bin.install "star"
  end

  test do
    system "#{bin}/star", "--version"
  end
end
