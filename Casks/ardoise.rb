cask "ardoise" do
  version "2.10.0"
  # Replaced by the release job together with the version.
  sha256 "e3fea87a636931f26ba308ca9c9a3ed6053fce78a1ab1a56d352fa8cd557ee85"

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
