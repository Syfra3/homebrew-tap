class Rotta < Formula
  desc "Contract-driven development orchestrator for AI coding agents"
  homepage "https://github.com/Syfra3/Rotta"
  version "1.20.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-arm64.tar.gz"
      sha256 "5018f6a4db7f35e481a509d4ffbd1fad31087be13a986021c0d2f02f3577d64c"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-darwin-amd64.tar.gz"
      sha256 "4bcce1d9efbe2c0d17bdd9334017fdf7505c9a771b9fd3a41444f2436dff2b14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-arm64.tar.gz"
      sha256 "912aa328b9d0ea9cc30eb7afbf2b7d0d25109b607ce932961e3f1875c7fa69d6"
    else
      url "https://github.com/Syfra3/Rotta/releases/download/v#{version}/rotta-#{version}-linux-amd64.tar.gz"
      sha256 "c24b361d01b94940c21dc538c53a2511191f813ec00a655cc9d48adf7aeed920"
    end
  end

  def install
    bin.install "rotta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rotta --version")
  end
end
