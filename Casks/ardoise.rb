cask "ardoise" do
  version "2.5.0"
  # Replaced by the release job together with the version.
  sha256 "8e3efc4fa222af4a132fc9181f301270d21d5b16d2acac5ca45826524d863139"

  url "https://github.com/ardoise-editor/ardoise/releases/download/v#{version}/ardoise-v#{version}-macos-aarch64.zip"
  name "Ardoise"
  desc "Fast, stable, cross-platform text editor with syntax highlighting"
  homepage "https://ardoise-editor.github.io/ardoise/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Ardoise.app"
  binary "#{appdir}/Ardoise.app/Contents/MacOS/ardoise"

  zap trash: [
    "~/Library/Application Support/ardoise",
    "~/Library/Preferences/app.ardoise.Ardoise.plist",
    "~/Library/Saved Application State/app.ardoise.Ardoise.savedState",
  ]
end
