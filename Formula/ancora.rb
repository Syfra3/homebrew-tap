class Ancora < Formula
  desc "Persistent memory system for AI agents with hybrid search and MCP integration"
  homepage "https://github.com/Syfra3/ancora"
  version "1.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-arm64.tar.gz"
      sha256 "fbc79aae6d39ab41b01e1466dc1b614fbccf6649f76a56f0f71f6ca86adbac48"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-amd64.tar.gz"
      sha256 "bf46ca91802184463a76bd37ef784048e991a9be24f91e64b0d2aa8f528b8755"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-arm64.tar.gz"
      sha256 "0f41d891c668d1ab9788ca54fd30c951909bc4167fc8155c182806e4b3141e72"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-amd64.tar.gz"
      sha256 "01b4a083e582461289df509d50073ce84fe58d08f782d39fcf86dc2df163a140"
    end
  end

  def install
    bin.install "ancora"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ancora version 2>&1")
  end
end
