cask "container-sweeper" do
  version "0.1.0"
  sha256 "1b5c485dbe734b7b8125c7f2e7c44127941569d7d2ea4a599803fc2be7c26b03"

  url "https://github.com/rioriost/homebrew-cask/releases/download/container-sweeper-v#{version}/container-sweeper-#{version}-macos-arm64.zip"
  name "Container Sweeper"
  desc "Schedule and deduplicate Apple Container cleanup"
  homepage "https://github.com/rioriost/homebrew-cask"

  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on formula: "container"

  app "Container Sweeper.app"

  uninstall launchctl: ["dev.containersweeper.schedule.*", "dev.containersweeper.job.*"],
            quit:      "dev.containersweeper.app",
            delete:    [
              "~/Library/LaunchAgents/dev.containersweeper.schedule.*.plist",
              "~/Library/LaunchAgents/dev.containersweeper.job.*.plist",
            ]

  zap trash: [
    "~/Library/Application Support/ContainerSweeper",
    "~/Library/Logs/ContainerSweeper",
    "~/Library/Preferences/dev.containersweeper.app.plist",
  ]

  caveats <<~EOS
    Open Container Sweeper and choose Save & Apply after installation or upgrade
    to install the current helper and register your cleanup schedules.
    The Apple Container service must already be running at cleanup time.
  EOS
end
