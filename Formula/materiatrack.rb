class Materiatrack < Formula
  desc "Mystical Final Fantasy-themed CLI time tracker for power users"
  homepage "https://github.com/ind4skylivey/matteria-track"
  version "1.0.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ind4skylivey/matteria-track/releases/download/v1.0.6/materiatrack-aarch64-apple-darwin.tar.xz"
      sha256 "600035a90686d3ac3fd93e8d9d52cf68a096553ba93e4b73ea6f0bdf3c9bf719"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ind4skylivey/matteria-track/releases/download/v1.0.6/materiatrack-x86_64-apple-darwin.tar.xz"
      sha256 "70ebadc386475d3c2f57dca6b6a3d1d6f219619ae78f6b7c43bc88fd3669954f"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ind4skylivey/matteria-track/releases/download/v1.0.6/materiatrack-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "2e5ed481cf9435fa8310a1ca519e7df5fea018add549fcb81aceb064ab827c76"
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
