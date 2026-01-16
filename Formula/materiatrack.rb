class Materiatrack < Formula
  desc "Mystical Final Fantasy-themed CLI time tracker for power users"
  homepage "https://github.com/ind4skylivey/matteria-track"
  version "1.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ind4skylivey/matteria-track/releases/download/v1.1.0/materiatrack-aarch64-apple-darwin.tar.xz"
      sha256 "1466437118de41d3e89c982cee1f65435361e1a3c637fde35e074ce1cb728157"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ind4skylivey/matteria-track/releases/download/v1.1.0/materiatrack-x86_64-apple-darwin.tar.xz"
      sha256 "c3f719553c6458b61f8e2769f3aed67c9fc2d6a5752fada5f641848aaf09a842"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
      url "https://github.com/ind4skylivey/matteria-track/releases/download/v1.1.0/materiatrack-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6494a32b8ee39719f5f34cf37b95b108b212c54212dbf15a4c4a9fd0fed5aca5"
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "materiatrack" if OS.mac? && Hardware::CPU.arm?
    bin.install "materiatrack" if OS.mac? && Hardware::CPU.intel?
    bin.install "materiatrack" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
