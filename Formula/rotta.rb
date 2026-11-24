class Rotta < Formula
  desc "Contract-driven development orchestrator for AI coding agents"
  homepage "https://github.com/Syfra3/Rotta"
  version "1.21.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-arm64.tar.gz"
      sha256 "c1725d0c122b112168da16d5db52eb3b2f1caa8f481a868b4efc6ef271ae89b6"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-amd64.tar.gz"
      sha256 "b0d41716d069f7b66214f3fe9bf850745b945472c1315239daadb1e992825b26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-arm64.tar.gz"
      sha256 "3e8dc2e78bff3a7c7d26fc00c0d5f32cc79f665a2e1ed8c4bf41600723654625"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-amd64.tar.gz"
      sha256 "0289ce788f079126bb80ec975b0984b35531cc34c32a52b421b1be82cfffe66c"
    end
  end

  def install
    bin.install "rotta"
    (prefix/"rotta-assets").install "observability", "assets"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rotta --version")
  end
end
