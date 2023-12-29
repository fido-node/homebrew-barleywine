class RustyBelt < Formula
  desc "Rust replacement for tmux powerline"
  homepage "https://rusty-belt.fidonode.me/"
  url "https://github.com/fido-node/rusty-belt/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "127554c0418f6f56223e6e1691197f61ca1a6f6744f2578da71e4c9614b2c5fd"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  service do
    name macos: "./resources/rusty-belt",
         linux: "./resourcer/rusty-belt"
  end



  test do
    system "false"
  end
end
