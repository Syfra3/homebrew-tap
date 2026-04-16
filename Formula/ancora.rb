class Ancora < Formula
  desc "Persistent memory system for AI agents with hybrid search and MCP integration"
  homepage "https://github.com/Syfra3/ancora"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-arm64.tar.gz"
      sha256 "24efb8e5396777d8cb65a7051f366a9563f78d36b58d3c70811184b9f92efdf9"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-amd64.tar.gz"
      sha256 "9eea038abf1e0b16e3ae5caf0481e43d3def1e35b69306706db3f8ee1118f13a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-arm64.tar.gz"
      sha256 "059625fb0b3a2ab5ea5adbfb47c0c6ed1212844fa436270f313a5047995acabd"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-amd64.tar.gz"
      sha256 "229f608ac44dcae47198298486605bdf074e023973eea5f302e25252536532c6"
    end
  end

  def install
    bin.install "ancora"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ancora version 2>&1")
  end
end
