class Rotta < Formula
  desc "Contract-driven development orchestrator for AI coding agents"
  homepage "https://github.com/Syfra3/Rotta"
  version "1.16.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-arm64.tar.gz"
      sha256 "62f6565fa4f348d3ef507af4a42c281c3e315c41b6729dd0dce2397adb4e6d13"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-amd64.tar.gz"
      sha256 "6f4c4fb5ec1ca1d17073e1b8c1bddaf0758f80f31824c1880a3a19e2d871edbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-arm64.tar.gz"
      sha256 "235d0e1cc4ce9bb16b7337f01ca010d24066ca07b10fb642defeded22d60031f"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-amd64.tar.gz"
      sha256 "6b030864030d38148bf7671c00c96db535a83c7e37fc553a10277f94d7ff6b2e"
    end
  end

  def install
    bin.install "rotta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rotta --version")
  end
end
