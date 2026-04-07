class Ancora < Formula
  desc "Persistent memory system for AI agents with hybrid search and MCP integration"
  homepage "https://github.com/Syfra3/ancora"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-arm64.tar.gz"
      sha256 "e11e7564b6cc3d7c19e9fe869e090c93862ed4f188648fda5c24883aa431b5b4"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-amd64.tar.gz"
      sha256 "2a3e7c23da0a4cda9a1195d47d5f6ae99c88f418f792defeb460fb0fe411f309"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-arm64.tar.gz"
      sha256 "7debc4ee9b12cd9a7580ccfbb3249ccb05fc331e23d7e265ec9ebd036909ffef"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-amd64.tar.gz"
      sha256 "84d999c17c63f68bbdad73e97e44562c31d04c466993bd38e38d7bafe8fde674"
    end
  end

  def install
    # Tarball contains a platform-specific binary name like "ancora-1.0.2-linux-amd64"
    # We need to rename it to just "ancora" when installing
    binary_name = Dir["ancora-*"].first
    bin.install binary_name => "ancora"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ancora version 2>&1")
  end
end
