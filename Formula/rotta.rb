class Rotta < Formula
  desc "Contract-driven development orchestrator for AI coding agents"
  homepage "https://github.com/Syfra3/Rotta"
  version "1.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-arm64.tar.gz"
      sha256 "65ca0eac80b1a2a48beb48a8c1fbb3374677b4ad1549d078003d8476075ca1d2"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-amd64.tar.gz"
      sha256 "b3ded65895519d418d820795803512cb15997d0f4bbc6ac839e7f8760d9be65b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-arm64.tar.gz"
      sha256 "144fc5e4b645a8132a1d64b24fb9ea80896caa6b6d5b5effd00d416d965fdbeb"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-amd64.tar.gz"
      sha256 "b4d11709c522e7b65d5911450e9062dfe005b22aaa26e6e19b88c4ab9e591d7d"
    end
  end

  def install
    bin.install "rotta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rotta --version")
  end
end
