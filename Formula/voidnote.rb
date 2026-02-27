class Voidnote < Formula
  desc "CLI for VoidNote — zero-knowledge self-destructing notes and live encrypted streams"
  homepage "https://voidnote.net"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/quantum-encoding/voidnote-cli/releases/download/v0.1.0/voidnote_0.1.0_darwin_amd64.tar.gz"
      sha256 "ce0cbf07818311d4fa79473ef4ad2acb78c894f89d855493143017bf42629709"
    end
    on_arm do
      url "https://github.com/quantum-encoding/voidnote-cli/releases/download/v0.1.0/voidnote_0.1.0_darwin_arm64.tar.gz"
      sha256 "b8ef166515bf95f48a49bafbb91c01b1c35561e6c39bbaffac178c3ff45841eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/quantum-encoding/voidnote-cli/releases/download/v0.1.0/voidnote_0.1.0_linux_amd64.tar.gz"
      sha256 "47cf4d1b75156202f17d26817ee84c6a910c52c5a99ed4108472018904c9a9ce"
    end
    on_arm do
      url "https://github.com/quantum-encoding/voidnote-cli/releases/download/v0.1.0/voidnote_0.1.0_linux_arm64.tar.gz"
      sha256 "99c125ceb2a3e50fc3c466bc64522e6d35e9c40121d035d60f7fb5dfd66990cb"
    end
  end

  def install
    bin.install "voidnote"
  end

  test do
    assert_match "voidnote 0.1.0", shell_output("#{bin}/voidnote version")
  end
end
