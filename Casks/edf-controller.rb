cask "edf-controller" do
  version "0.2.3"
  sha256 "221128fe80d0b0a734fc398daa53910465268c4b1ce21ba454701909c45729cc"

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
