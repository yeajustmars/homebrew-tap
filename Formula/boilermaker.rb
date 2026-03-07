class Boilermaker < Formula
  desc "Language-agnostic code templates for rapid project boilerplate setup"
  homepage "https://github.com/yeajustmars/boilermaker"
  license "MIT"

  on_arm do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/v0.1.0-beta0/boilermaker_cli-aarch64-apple-darwin.tar.xz"
      sha256 "0f54a0b49b4588248a7894f043f28eaec2f2434219e01d9b0393eb8660d6cba6"
    end

    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/v0.1.0-beta0/boilermaker_cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b0e68b481bd95e5f4299ccd43739182e2c40ac499a584830937399b7b916a8dd"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/v0.1.0-beta0/boilermaker_cli-x86_64-apple-darwin.tar.xz"
      sha256 "0653ab2ed554bc99d578aa64a3729c50cf8a2c5356182157e27ed9370d80286c"
    end
    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/v0.1.0-beta0/boilermaker_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a6f5008f072d8bb3deada4215d04e4ed0e6f61dbe189afb6ece262da2b332dfe"
    end
  end

  def install
    bin.install "boil"
  end

  test do
    assert_equal "boilermaker_cli 0.1.0-beta0\n", shell_output("'#{bin}/boil' -V")
  end
end
