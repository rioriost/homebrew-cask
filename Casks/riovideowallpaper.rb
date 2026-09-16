cask "riovideowallpaper" do
  version "1.2.1"
  sha256 "33d23bf8f5a9ff835c836fe8d65ea6c38117512349c83e5497ddb8526e43ed5b"

  url "https://github.com/rioriost/RioVideoWallpaper/releases/download/#{version}/RioVideoWallpaper-#{version}.zip"
  name "RioVideoWallpaper"
  desc "Play videos as your macOS wallpaper"
  homepage "https://github.com/rioriost/RioVideoWallpaper"

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

  app "RioVideoWallpaper.app"

  zap trash: [
    "~/Library/Application Support/RioVideoWallpaper",
    "~/Library/Containers/st.rio.VideoWallpaper",
    "~/Library/Preferences/st.rio.VideoWallpaper.plist",
    "~/Library/Saved Application State/st.rio.VideoWallpaper.savedState",
  ]
end
