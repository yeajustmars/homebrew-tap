class Boilermaker < Formula
  desc "Language-agnostic code templates for rapid project boilerplate setup"
  homepage "https://github.com/yeajustmars/boilermaker"
  license "MIT"

  version "v0.1.0-beta17"

  on_arm do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-aarch64-apple-darwin.tar.xz"
      sha256 "0d69992ed7b5c60b0f7d4304d0e0c7579c2fc8629fe75405120456ba92e9f8a3"
    end

    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "87b660c8faceb3c39e940c5b24dbf17bc07892f522dade531f8a97602d3e678a"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-x86_64-apple-darwin.tar.xz"
      sha256 "66c06d89fcb9dc7200593444b456a66756ac8c8f8b5fbe013eed9676b2f6f4f7"
    end
    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "828dcf8bd692e4096e9c53dd1f6be4309fac0f1fc3751cc6634e299a9fd70897"
    end
  end

  def install
    bin.install "boil"
  end

  test do
    assert_equal "boilermaker #{version.delete_prefix('v')}\n", shell_output("'#{bin}/boil' -V")
  end
end
