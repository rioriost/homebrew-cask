cask "edf-controller" do
  version "0.2.0"
  sha256 "92b412ba0a8b96ae6840a906f0349a303173dfa74c7528490d767468272b3944"

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
