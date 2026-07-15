cask "edifier-controller" do
  version "0.1.0"
  sha256 "1372af19392d71526edafb77c69079278830a42d9222540606eb21b28bc76fa9"

  url "https://github.com/rioriost/edf-controller/releases/download/v#{version}/EdifierController-#{version}.zip"
  name "Edifier Controller"
  desc "Menu bar controller for Edifier S880DB MKII speakers"
  homepage "https://github.com/rioriost/edf-controller"

  depends_on macos: :ventura

  app "Edifier Controller.app"

  zap trash: "~/Library/Preferences/jp.rifujita.edifier-controller.plist"
end
