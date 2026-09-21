cask "edf-controller" do
  version "0.2.2"
  sha256 "34e1dff66520bba77fe7597d0d1fccff41445b7a24f2dd57b349072ff3626528"

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
