class Vela < Formula
  desc "Knowledge graph daemon for AI agents with real-time Ancora sync and Obsidian export"
  homepage "https://github.com/Syfra3/vela"
  version "1.10.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-darwin-arm64.tar.gz"
      sha256 "ee9e100bef73ba7d37633250d07f8dc11590bfa4a17a9982c863c2b9e7e2ff6e"
    else
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-darwin-amd64.tar.gz"
      sha256 "b8a2c32b29c94bb1ac0c38a90f0388775b2cc726ef822c0544ae57fdabc6523e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-linux-arm64.tar.gz"
      sha256 "fa60c0783ead19ca7106c5b1c968523c81413f5a31e58cbe02883bec17fa1cf1"
    else
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-linux-amd64.tar.gz"
      sha256 "8cfb4726817a89574025e8905b8da13c7c64fbb4a4e69bb4a63f14cb1076821e"
    end
  end

  def install
    bin.install "vela"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vela version 2>&1")
  end
end
