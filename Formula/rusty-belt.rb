class RustyBelt < Formula
  desc "Rust replacement for tmux powerline"
  homepage "https://rusty-belt.fidonode.me/"
  url "https://github.com/fido-node/rusty-belt/archive/refs/tags/v0.0.13.tar.gz"
  sha256 "0a68e3cea1e3d16f964f4e8371434ffee9588954ea15e146022137ac5ec4bf12"
  license "Apache-2.0"

  depends_on "rust" => :build
  depends_on "protobuf" => :build

  def install
    system "cargo", "install", *std_cargo_args
    pkgshare.install "examples/config.yaml"
    pkgshare.install "examples/log4rs.yaml"
  end

  def caveats
    <<~EOS
      Example configuration (config.yaml, log4rs.yaml) has been installed to:
        #{opt_pkgshare}
      Copy it to ~/Library/Application Support/rusty-belt on Mac
	or to ~/.config/rusty-belt on Linux
      Mac:
      mkdir -p ~/Library/Application\\ Support/rusty-belt
      cp #{opt_pkgshare}/*.yaml ~/Library/Application\\ Support/rusty-belt
      Linux:
      mkdir -p  ~/.config/rusty-belt
      cp #{opt_pkgshare}/*.yaml ~/.config/rusty-belt

    EOS
  end

  service do
    run [opt_bin/"rusty_belt_server"]
    keep_alive true
  end


  test do
    system "false"
  end
end
