#!/bin/bash

BMHB_LOGO=$(cat <<'BMHB_TEXT'
 ___      _ _                    _             _  _               _
| _ ) ___(_) |___ _ _ _ __  __ _| |_____ _ _  | || |___ _ __  ___| |__ _ _ _____ __ __
| _ \/ _ \ | / -_) '_| '  \/ _` | / / -_) '_| | __ / _ \ '  \/ -_) '_ \ '_/ -_) V  V /
|___/\___/_|_\___|_| |_|_|_\__,_|_\_\___|_|   |_||_\___/_|_|_\___|_.__/_| \___|\_/\_/
BMHB_TEXT
)

BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}${BMHB_LOGO}${NC}\n"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $SCRIPT_DIR

if [ "$#" -ne 2 ]; then
    echo "Usage: ./generate_formula.sh <version> <path_to_sha256.sum>"
    exit 1
fi

VERSION=$1
SUM_FILE=$2

if [ ! -f "$SUM_FILE" ]; then
    echo "Error: Could not find the file $SUM_FILE"
    exit 1
fi

MAC_ARM=$(grep "boilermaker-aarch64-apple-darwin.tar.xz" "$SUM_FILE" | awk '{print $1}')
LINUX_ARM=$(grep "boilermaker-aarch64-unknown-linux-gnu.tar.xz" "$SUM_FILE" | awk '{print $1}')
MAC_INTEL=$(grep "boilermaker-x86_64-apple-darwin.tar.xz" "$SUM_FILE" | awk '{print $1}')
LINUX_INTEL=$(grep "boilermaker-x86_64-unknown-linux-gnu.tar.xz" "$SUM_FILE" | awk '{print $1}')

if [ -z "$MAC_ARM" ] || [ -z "$LINUX_ARM" ] || [ -z "$MAC_INTEL" ] || [ -z "$LINUX_INTEL" ]; then
    echo "Warning: One or more hashes could not be found in $SUM_FILE."
fi

cat << EOF > Formula/boilermaker.rb
class Boilermaker < Formula
  desc "Language-agnostic code templates for rapid project boilerplate setup"
  homepage "https://github.com/yeajustmars/boilermaker"
  license "MIT"

  version "${VERSION}"

  on_arm do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-aarch64-apple-darwin.tar.xz"
      sha256 "${MAC_ARM}"
    end

    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "${LINUX_ARM}"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-x86_64-apple-darwin.tar.xz"
      sha256 "${MAC_INTEL}"
    end
    on_linux do
      url "https://github.com/yeajustmars/boilermaker/releases/download/#{version}/boilermaker-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "${LINUX_INTEL}"
    end
  end

  def install
    bin.install "boil"
  end

  test do
    assert_equal "boilermaker_cli #{version.delete_prefix('v')}\n", shell_output("'#{bin}/boil' -V")
  end
end
EOF

echo "Successfully generated boilermaker.rb for version ${VERSION}!"
