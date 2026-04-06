class Ancora < Formula
  desc "Persistent memory system for AI agents with hybrid search and MCP integration"
  homepage "https://github.com/Syfra3/ancora"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_DARWIN_AMD64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-amd64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_AMD64"
    end
  end

  def install
    bin.install "ancora"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ancora --version")
  end
end
