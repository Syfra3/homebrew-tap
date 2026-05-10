class Ancora < Formula
  desc "Persistent memory system for AI agents with hybrid search and MCP integration"
  homepage "https://github.com/Syfra3/ancora"
  version "1.10.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-arm64.tar.gz"
      sha256 "1c5ae86f03aaf57b79add08df5e8f725d9baf740c0107606d2643cd5e43c5d12"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-amd64.tar.gz"
      sha256 "1fa0c66d01b33e25fc152d23bf9b3464cc73ef0c556557882bb3ee1c0e51fede"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-arm64.tar.gz"
      sha256 "58f2f9c86ccc8dd7f75bf7eb148977e36a856405fad616cbba1ce1e6ca8a919b"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-amd64.tar.gz"
      sha256 "7da82f972e0c1a3eb6084852945f4e011d198647a56eaf2f6a5f7d0caf1c5ff1"
    end
  end

  def install
    bin.install "ancora"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ancora version 2>&1")
  end
end
