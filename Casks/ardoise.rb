cask "ardoise" do
  version "2.0.3"
  # Replaced by the release job together with the version.
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

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
  # The command was called simpleedit.
  binary "#{appdir}/Ardoise.app/Contents/MacOS/ardoise", target: "simpleedit"

  zap trash: [
    "~/Library/Application Support/ardoise",
    "~/Library/Application Support/simpleedit",
    "~/Library/Preferences/app.ardoise.Ardoise.plist",
    "~/Library/Preferences/app.simpleedit.SimpleEdit.plist",
    "~/Library/Saved Application State/app.ardoise.Ardoise.savedState",
    "~/Library/Saved Application State/app.simpleedit.SimpleEdit.savedState",
  ]
end
