cask "edifier-controller" do
  version "0.1.2"
  sha256 "da36b226c73f4943a527c07c5c3679dc8a733d2f8a599a622ce37b7fd5593a43"

  url "https://github.com/rioriost/edf-controller/releases/download/v#{version}/EdifierController-#{version}.zip"
  name "Edifier Controller"
  desc "Menu bar controller for Edifier S880DB MKII speakers"
  homepage "https://github.com/rioriost/edf-controller"

  depends_on macos: :ventura

  app "Edifier Controller.app"

  zap trash: "~/Library/Preferences/jp.rifujita.edifier-controller.plist"
end
