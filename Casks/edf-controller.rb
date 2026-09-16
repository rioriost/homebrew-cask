cask "edf-controller" do
  version "0.2.1"
  sha256 "c7f360f13d3e8ae8aeb0db9447603c32da8f5d6d6c7068103abde70a422a44de"

  url "https://github.com/rioriost/edf-controller/releases/download/v#{version}/EdfController-#{version}.zip"
  name "Edf Controller"
  desc "Menu bar controller for S880DB MKII speakers"
  homepage "https://github.com/rioriost/edf-controller"

  depends_on macos: :ventura

  app "Edf Controller.app"

  zap trash: [
    "~/Library/Preferences/jp.rifujita.edf-controller.plist",
    "~/Library/Preferences/jp.rifujita.edifier-controller.plist",
  ]
end
