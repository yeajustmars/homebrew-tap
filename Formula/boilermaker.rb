class Boilermaker < Formula
  desc "Language-agnostic code templates for rapid project boilerplate setup"
  homepage "https://github.com/yeajustmars/boilermaker"
  license "MIT"

  version 'v0.1.0-rc0'

  on_arm do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker_cli-aarch64-apple-darwin.tar.xz"
      sha256 "933cdf6dc6befddfe87f805313129cfc3299f7f6c767c8f84153c21ac206985d "

    end

    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker_cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "334218412d8dfbc363f48189ceec23f43163009f620dbe9efc6fdd4f435cff6a "

    end
  end

  on_intel do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker_cli-x86_64-apple-darwin.tar.xz"
      sha256 "6d6a45d91343e9dcc30044d4b9fec4eea04e0a052cb414b73ef97cf7f9218aff "

    end
    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "22df981a1d910a340c23c00dffaf636b3315cde351a76a71fa527ae77ff95e42 "

    end
  end

  def install
    bin.install "boil"
  end

  test do
    assert_equal "boilermaker_cli 0.1.0-rc0\n", shell_output("'#{bin}/boil' -V")
  end
end
