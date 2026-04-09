class Ancora < Formula
  desc "Persistent memory system for AI agents with hybrid search and MCP integration"
  homepage "https://github.com/Syfra3/ancora"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-arm64.tar.gz"
      sha256 "921908b3896bf8852f8a62ff8c7ed99ff899a5fff60b5be73d5d4205f81ae23b"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-amd64.tar.gz"
      sha256 "f22c07947b09bcd539a51ff7575be1e00f57074eb4e7032df6bcaf9ae6785ff9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-arm64.tar.gz"
      sha256 "bcffa4a77ee292c9656aefb7a9c68145cb5b45d6b94d9e311e1b5af5644ffb2c"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-amd64.tar.gz"
      sha256 "4a98d52efd551736e56f3f0c345d78b4a01b800a50f60409c57c90dc5d9d797a"
    end
  end

  def install
    bin.install "ancora"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ancora version 2>&1")
  end
end
