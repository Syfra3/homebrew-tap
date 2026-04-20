class Ancora < Formula
  desc "Persistent memory system for AI agents with hybrid search and MCP integration"
  homepage "https://github.com/Syfra3/ancora"
  version "1.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-arm64.tar.gz"
      sha256 "edbe82cc4b87af4501a81f3835913c494455a09cbb1e9e171ac388f47e6e754b"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-darwin-amd64.tar.gz"
      sha256 "6cb362cb4ee70fe498b448e666688b7baeea419bb4c22beb4f43c2c83c5c5e03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-arm64.tar.gz"
      sha256 "8afaa6ea3639b4bfbbfad4c9bd3fbca4f689d50c40f93b04f80de110efd2d61c"
    else
      url "https://github.com/Syfra3/ancora/releases/download/v#{version}/ancora-#{version}-linux-amd64.tar.gz"
      sha256 "8188ee3d698f822dbab9133ff31bc3be2f1d4a581d082e6f1733711d8cc0580c"
    end
  end

  def install
    bin.install "ancora"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ancora version 2>&1")
  end
end
