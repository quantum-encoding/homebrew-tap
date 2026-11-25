# The Developer ID build of zdedupe, which updates itself with Sparkle from
# https://quantumencoding.io/updates/zdedupe/appcast.xml — hence
# `auto_updates true`: `brew upgrade` leaves it to the app. The version and
# sha256 here are rewritten by zdedupe-app/scripts/release.sh on every
# release. Notarized and stapled.
cask "zdedupe" do
  version "1.0.11"
  sha256 "9217fb4a589b8655e382b77538c54cd9ba4a82233eebd9eee12c18a7618bb41a"

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
