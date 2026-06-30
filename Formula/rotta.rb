class Rotta < Formula
  desc "Contract-driven development orchestrator for AI coding agents"
  homepage "https://github.com/Syfra3/Rotta"
  license "Apache-2.0"

  head "https://github.com/Syfra3/Rotta.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/rotta"
  end

  test do
    assert_match "rotta", shell_output("#{bin}/rotta --help")
  end
end
