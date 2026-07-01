class Rotta < Formula
  desc "Contract-driven development orchestrator for AI coding agents"
  homepage "https://github.com/Syfra3/Rotta"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/rotta-v#{version}/rotta-#{version}-darwin-arm64.tar.gz"
      sha256 "69fdffa31cd59c406c331513a63d9feb4834dd915c94748b2db7a25da9acbdfd"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/rotta-v#{version}/rotta-#{version}-darwin-amd64.tar.gz"
      sha256 "12e2080744706077e07ea321b9a17037b21407aefdca97cec5b4b136fa93a2c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/rotta-v#{version}/rotta-#{version}-linux-arm64.tar.gz"
      sha256 "16ce85903a3c6161781b19f4adcb591468dc2988a2c60085f8332d9421e5f48e"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/rotta-v#{version}/rotta-#{version}-linux-amd64.tar.gz"
      sha256 "2c31efd72a7a573f370216be9d33f8ccacfd6dc96d71b5ba5937e89805abbefa"
    end
  end

  def install
    bin.install "rotta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rotta --version")
  end
end
