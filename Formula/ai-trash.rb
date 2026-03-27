class AiTrash < Formula
  desc "Move files to system trash — safe alternative to rm"
  homepage "https://github.com/quantum-encoding/ai-trash"
  url "https://github.com/quantum-encoding/ai-trash/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1df9d528361f71e966b02051879aa37932ba1d68129e3687188fb9efd5c03006"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "trash", shell_output("#{bin}/trash --help")
    assert_match version.to_s, shell_output("#{bin}/trash --version")
  end
end
