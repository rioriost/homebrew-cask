cask "videowallpaper" do
  version "0.1.0"
  sha256 "cdb22c137d29f43ad4b03b16300026845736330c93288fa7fe252377f316e27f"

  url "https://github.com/rioriost/videowallpaper/releases/download/0.1.0/VideoWallpaper-0.1.0.zip"
  name "VideoWallpaper"
  desc "Play videos as your macOS wallpaper"
  homepage "https://github.com/rioriost/videowallpaper"

  app "VideoWallpaper.app"

  zap trash: [
    "~/Library/Application Support/VideoWallpaper",
    "~/Library/Preferences/*VideoWallpaper*.plist",
    "~/Library/Saved Application State/*VideoWallpaper*.savedState",
  ]
end
