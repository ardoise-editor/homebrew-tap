cask "ardoise" do
  version "2.1.0"
  # Replaced by the release job together with the version.
  sha256 "fa750f2d17c0433016eb1e7ebb684c9190a01af217cbad177ff23e16b0310387"

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
