# The Developer ID build of zdedupe, which updates itself with Sparkle from
# https://quantumencoding.io/updates/zdedupe/appcast.xml — hence
# `auto_updates true`: `brew upgrade` leaves it to the app. The version and
# sha256 here are rewritten by zdedupe-app/scripts/release.sh on every
# release. Notarized and stapled.
cask "zdedupe" do
  version "1.0.4"
  sha256 "a11b69bc230192dc3cb5d60a48f8c0a7213df384af6920f8c42a20afe0c03183"

  url "https://quantumencoding.io/updates/zdedupe/#{version}/zdedupe.zip"
  name "zdedupe"
  desc "Find duplicate files and compare folders by content"
  homepage "https://quantumencoding.io/software"

  livecheck do
    url "https://quantumencoding.io/updates/zdedupe/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "zdedupe.app"

  zap trash: [
    "~/Library/Application Scripts/io.quantumencoding.zdedupe",
    "~/Library/Containers/io.quantumencoding.zdedupe",
  ]
end
