class Vela < Formula
  desc "Knowledge graph daemon for AI agents with real-time Ancora sync and Obsidian export"
  homepage "https://github.com/Syfra3/vela"
  version "1.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-darwin-arm64.tar.gz"
      sha256 "6ff4a5e5bb89caa933df81fa2f0d6fb174c11c20d7ebddbf28876356d9497dce"
    else
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-darwin-amd64.tar.gz"
      sha256 "ad1fadb2ac02c734942e1d05291453a849da4398ad5bbd3498047ae1f97de2fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-linux-arm64.tar.gz"
      sha256 "9b9d596ae17fded3bf92c14f19e0b112dd9815d7bb9609466877a9a09bc66fa4"
    else
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-linux-amd64.tar.gz"
      sha256 "1a7026ee1d08d51535c5a1e3bc8fece595bce95c20b23470f5087c534023a526"
    end
  end

  def install
    bin.install "vela"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vela version 2>&1")
  end
end
