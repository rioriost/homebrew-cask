cask "edf-controller" do
  version "0.1.3"
  sha256 "53fdce636033d6d5a438ad573394ae3f89166f004d5f47d6d7cfe10221563bc4"

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
