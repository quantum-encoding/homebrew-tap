# Binary formula, deliberately: a source build (homebrew-core style) produces
# an UNSIGNED binary that cannot reach the biometric Keychain or the Secure
# Enclave envelope key (-34018). The Developer ID signature travels inside the
# Mach-O, so shipping the already-signed release asset keeps Touch ID working.
class Secrets < Formula
  desc "Biometric secrets vault — Secure Enclave envelope master, scoped injection"
  homepage "https://crates.io/crates/secrets-vault"
  url "https://github.com/quantum-encoding/secrets-vault/releases/download/v2.5.0/secrets-2.5.0-macos-arm64.zip"
  sha256 "41c5f4c1e2d387808900db8922cf9429a3901a7ef40ff554dc55e7813d0e484c"
  version "2.5.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "secrets"
  end

  def caveats
    <<~EOS
      First use creates a vault via the enrollment ceremony (the recovery key
      is shown once and must be typed back). Touch ID prompts come from the
      binary's Developer ID signature — do not re-sign or strip it.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/secrets --version")
  end
end
