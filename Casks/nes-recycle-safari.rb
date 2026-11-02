cask "nes-recycle-safari" do
  version "0.0.6"
  sha256 "7af08b8d24d508a897f603ec56faa7acbd05bfbf5f7930a76454ea5c2c176c6d"

  url "https://github.com/rioriost/nes_recycle/releases/download/#{version}/nes_recycle-safari-#{version}-macos.zip"
  name "nes_recycle Safari Extension"
  desc "Fill the Nespresso recycling pickup form in Safari"
  homepage "https://github.com/rioriost/nes_recycle"

  depends_on macos: :tahoe

  app "nes_recycle.app"

  caveats <<~EOS
    macOS 26.2 or later is required by the app.
    Open nes_recycle once, then enable its extension in Safari > Settings > Extensions.
    Allow access to input-form.jp when Safari prompts for website permissions.
  EOS
end
