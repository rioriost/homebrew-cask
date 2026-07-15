cask "edifier-controller" do
  version "0.1.1"
  sha256 "9aa7e18d804cba256a08f7613d3505859fa00082bba531a3716cdc660b49b1c7"

  url "https://github.com/rioriost/edf-controller/releases/download/v#{version}/EdifierController-#{version}.zip"
  name "Edifier Controller"
  desc "Menu bar controller for Edifier S880DB MKII speakers"
  homepage "https://github.com/rioriost/edf-controller"

  depends_on macos: :ventura

  app "Edifier Controller.app"

  zap trash: "~/Library/Preferences/jp.rifujita.edifier-controller.plist"
end
