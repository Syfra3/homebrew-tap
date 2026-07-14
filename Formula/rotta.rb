class Rotta < Formula
  desc "Contract-driven development orchestrator for AI coding agents"
  homepage "https://github.com/Syfra3/Rotta"
  version "1.8.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-arm64.tar.gz"
      sha256 "47d7cd637542cdcd854eecffc839e5ef4d536b331c9d9fad99a7c222afd0ca62"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-amd64.tar.gz"
      sha256 "957c4d656664423d396e8d17e2eed5c4c9f5141b213edc118e9d8a796d4f728d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-arm64.tar.gz"
      sha256 "3813bf4133670ad2ba9d1c7019d01f689e23aab8dc712101908e4b3c1373241b"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-amd64.tar.gz"
      sha256 "2aa2b056b21d4d0d9b639caab4b70ca34081c3ceea9d0a215facf98ea8501ea1"
    end
  end

  def install
    bin.install "rotta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rotta --version")
  end
end
