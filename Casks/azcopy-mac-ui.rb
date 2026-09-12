cask "azcopy-mac-ui" do
  version "0.2.0"
  sha256 "b4f0d582b14acd266e90489962db28bce0de2bc2bd73bca75f41cc30aae63405"

  url "https://github.com/rioriost/azcopy-mac-ui/releases/download/v#{version}/azcopy-mac-ui-#{version}-macos-arm64.zip"
  name "AzCopy Mac UI"
  desc "GUI for Azure AzCopy transfers"
  homepage "https://github.com/rioriost/azcopy-mac-ui"

  depends_on arch: :arm64
  depends_on macos: :sonoma
  depends_on formula: "azcopy"

  app "AzCopy Mac UI.app"

  zap trash: [
    "~/Library/Application Support/AzCopy Mac UI",
    "~/Library/Logs/AzCopy Mac UI",
    "~/Library/Preferences/com.github.azcopy-mac-ui.plist",
  ]
end
