# A cask, deliberately not a formula: a tap formula with no bottle is a
# "source build" to brew, which then demands a current Xcode toolchain even
# when `def install` only copies a file. A cask installs the prebuilt binary
# with no toolchain check — and prebuilt is the point: the Developer ID
# signature inside the Mach-O is what lets `secrets` reach the biometric
# Keychain and the Secure Enclave envelope key; a source build cannot (-34018).
cask "secrets" do
  version "2.5.0"
  sha256 "41c5f4c1e2d387808900db8922cf9429a3901a7ef40ff554dc55e7813d0e484c"

  url "https://github.com/quantum-encoding/secrets-vault/releases/download/v#{version}/secrets-#{version}-macos-arm64.zip"
  name "secrets"
  desc "Biometric secrets vault — Secure Enclave envelope master, scoped injection"
  homepage "https://crates.io/crates/secrets-vault"

  depends_on arch: :arm64

  binary "secrets-#{version}-macos-arm64/secrets"

  caveats <<~EOS
    First use creates a vault via the enrollment ceremony (the recovery key
    is shown once and must be typed back). Touch ID prompts come from the
    binary's Developer ID signature — do not re-sign or strip it. The
    download is notarized, so a Gatekeeper first-run check passes.
  EOS
end
