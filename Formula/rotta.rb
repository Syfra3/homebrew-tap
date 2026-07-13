class Rotta < Formula
  desc "Contract-driven development orchestrator for AI coding agents"
  homepage "https://github.com/Syfra3/Rotta"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-arm64.tar.gz"
      sha256 "4559e978373203bc3c8b03f9a2d12640b049eebefcd3b8bc89b97c75efc98c12"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-amd64.tar.gz"
      sha256 "14322e9a688311d6bfd8623e6971351dee7a034c380afaa3a0e6c66ae9543e79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-arm64.tar.gz"
      sha256 "7d660324b1a177606c354cf7403b67a5d85efc9a8d3d462d00c17ee3aff7cc7a"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-amd64.tar.gz"
      sha256 "53cfb13c365088e9612e66e815db784eacaf27ee393171ff49c90b8c959431fd"
    end
  end

  def install
    bin.install "rotta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rotta --version")
  end
end
