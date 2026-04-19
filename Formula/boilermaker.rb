class Boilermaker < Formula
  desc "Language-agnostic code templates for rapid project boilerplate setup"
  homepage "https://github.com/yeajustmars/boilermaker"
  license "MIT"

  version "v0.1.0-beta18"

  on_arm do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-aarch64-apple-darwin.tar.xz"
      sha256 "16f671b966c06fa6c158bb1970eff597f6dd6f06469562830d34196b69215047"
    end

    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "55ef90d624446bd490389c5654bd2cf58d3c57c74851394cfc1b323e15ab6e21"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-x86_64-apple-darwin.tar.xz"
      sha256 "a2d1e5ba0c8f3d73f615611f449a92e47e5fe567b41976a2921fc3ffc073f230"
    end
    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4994d24181d9a14599d441fac0721001b8f0a198a58e33e35281772d6436f100"
    end
  end

  def install
    bin.install "boil"
  end

  test do
    assert_equal "boilermaker #{version.delete_prefix('v')}\n", shell_output("'#{bin}/boil' -V")
  end
end
