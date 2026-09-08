class Vela < Formula
  desc "Knowledge graph daemon for AI agents with real-time Ancora sync and Obsidian export"
  homepage "https://github.com/Syfra3/vela"
  version "1.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-darwin-arm64.tar.gz"
      sha256 "3bff263f6f6922ef0f2d85cbe142d7ba222e5c365bc6521cef6f16fe78755cb5"
    else
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-darwin-amd64.tar.gz"
      sha256 "be371a4fe863a4fb5c76d7b8c91c792e5b0069be116c3316d16087758192a6be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-linux-arm64.tar.gz"
      sha256 "4ecd7e690845b628d2fd9e275f90a22cc3d1470b8c5e5d837a7706daf77b2a5d"
    else
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-linux-amd64.tar.gz"
      sha256 "cec2a283dd7d5961420e3fc84e0785814960d30c3d674b3050c45d59e44fd9fe"
    end
  end

  def install
    bin.install "vela"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vela version 2>&1")
  end
end
