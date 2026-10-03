# A cask, deliberately not a formula: a tap formula with no bottle is a
# "source build" to brew, which then demands a current Xcode toolchain even
# when `def install` only copies a file. A cask installs the prebuilt binary
# with no toolchain check — and prebuilt is the point: the Developer ID
# signature is what lets `secrets` reach the biometric Keychain and the Secure
# Enclave envelope key; a source build cannot (-34018). It ships as Secrets.app
# because that Keychain entitlement is restricted: macOS honours it only through
# the Developer ID provisioning profile embedded in the bundle, and kills a bare
# binary that claims it ("No matching profile found"). The CLI inside is linked
# onto PATH; the bundle stays in the Caskroom.
cask "secrets" do
  version "2.7.0"
  sha256 "b737efe28312a815344b886c46d99c9242642f1c5eeb88c5faacecf3ae5139df"

  url "https://github.com/quantum-encoding/secrets-vault/releases/download/v#{version}/secrets-#{version}-macos-arm64.zip"
  name "secrets"
  desc "Biometric secrets vault — Secure Enclave envelope master, scoped injection"
  homepage "https://crates.io/crates/secrets-vault"

  depends_on arch: :arm64

  binary "secrets-#{version}-macos-arm64/Secrets.app/Contents/MacOS/secrets", target: "secrets"

  caveats <<~EOS
    First use creates a vault via the enrollment ceremony (the recovery key
    is shown once and must be typed back). Touch ID prompts come from the
    bundle's Developer ID signature — do not re-sign or strip it, or move
    the CLI out of Secrets.app. The bundle is notarized and stapled.
  EOS
end
