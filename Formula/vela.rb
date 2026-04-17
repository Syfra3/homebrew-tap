class Vela < Formula
  desc "Knowledge graph daemon for AI agents with real-time Ancora sync and Obsidian export"
  homepage "https://github.com/Syfra3/vela"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-darwin-arm64.tar.gz"
      sha256 "79f69c66201380f02a3600680811a6b16080c1c3ebbd3f0de60e68ff4cf9c174"
    else
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-darwin-amd64.tar.gz"
      sha256 "119a9507884e73649cfd74160031152041d284cd58f3f33396faa845101249ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-linux-arm64.tar.gz"
      sha256 "b5cca50c3d047800e70d3aed429f1ce81da3727b7f232b65b961ee5deb1df5e1"
    else
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-linux-amd64.tar.gz"
      sha256 "7a13ac629924bf07b799ae14f070750532721d41ce91b8210ff4c46d64af0ca9"
    end
  end

  def install
    bin.install "vela"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vela version 2>&1")
  end
end
