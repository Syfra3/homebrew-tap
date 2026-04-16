class Vela < Formula
  desc "Knowledge graph daemon for AI agents with real-time Ancora sync and Obsidian export"
  homepage "https://github.com/Syfra3/vela"
  version "1.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-darwin-arm64.tar.gz"
      sha256 "f4f582874be4199dcae88cad811bbe834ac70e4cc53055d023e48489adcebfd2"
    else
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-darwin-amd64.tar.gz"
      sha256 "306c15ec10f6f9b5e3b8eabadc7c53b9ee4be8fc40bc9c1819a047aa9eaba408"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-linux-arm64.tar.gz"
      sha256 "21cdfcdaad8b52aaf21f5aaa2884067a638927901b5c3413bdf616146571c644"
    else
      url "https://github.com/Syfra3/vela/releases/download/v#{version}/vela-#{version}-linux-amd64.tar.gz"
      sha256 "991c8160ac5b8641b8d0e2c5a2bd546935f26290dab1f69c85e00a5674d49137"
    end
  end

  def install
    bin.install "vela"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vela version 2>&1")
  end
end
