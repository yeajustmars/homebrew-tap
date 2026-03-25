class Boilermaker < Formula
  desc "Language-agnostic code templates for rapid project boilerplate setup"
  homepage "https://github.com/yeajustmars/boilermaker"
  license "MIT"

  version 'v0.1.0-beta5'

  on_arm do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker_cli-aarch64-apple-darwin.tar.xz"
      sha256 "90115a792ed3924bcf9492d37420a59de111a97253b59119347456565eb1c466"
    end

    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker_cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0f54eba3ed4590f85e173b608af63dca442945a93b348cc7a9d10cffb96d3f57"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker_cli-x86_64-apple-darwin.tar.xz"
      sha256 "e80e5f0795223f46e991e20a3e70a9d6834c312cb58686278aca0bfb3869cbad"
    end
    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9e85339a999f42649df955893e6500350a9b3535bb1a14199bcd321021f564e5"
    end
  end

  def install
    bin.install "boil"
  end

  test do
    assert_equal "boilermaker_cli 0.1.0-beta5\n", shell_output("'#{bin}/boil' -V")
  end
end
