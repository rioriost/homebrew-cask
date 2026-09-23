cask "container-sweeper" do
  version "0.2.0"
  sha256 "748b43de96aa4c974a6d9318139cb3c76306337c9ad68d4d702ac98d1aab21cc"

  url "https://github.com/rioriost/homebrew-cask/releases/download/container-sweeper-v#{version}/container-sweeper-#{version}-macos-arm64.zip"
  name "Container Sweeper"
  desc "Schedule and deduplicate Apple Container cleanup"
  homepage "https://github.com/rioriost/homebrew-cask"

  depends_on arch: :arm64
  depends_on formula: "container"
  depends_on macos: :tahoe

  app "Container Sweeper.app"

  uninstall launchctl: ["dev.containersweeper.schedule.*", "dev.containersweeper.job.*"],
            quit:      "dev.containersweeper.app",
            delete:    [
              "~/Library/LaunchAgents/dev.containersweeper.job.*.plist",
              "~/Library/LaunchAgents/dev.containersweeper.schedule.*.plist",
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
