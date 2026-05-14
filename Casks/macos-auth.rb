cask "macos-auth" do
  version "0.1.0"
  sha256 "5db487bbda5471a292c1b961776b289a885083e55cd292fdf82802afa25a2d72"

  url "https://github.com/rioriost/macos-auth/releases/download/v#{version}/macos-auth-#{version}-darwin-arm64.pkg"
  name "macos-auth"
  desc "Agent for approving Linux PAM authentication requests"
  homepage "https://github.com/rioriost/macos-auth"

  depends_on arch: :arm64
  depends_on macos: :ventura

  pkg "macos-auth-#{version}-darwin-arm64.pkg"

  uninstall launchctl: "com.macos-auth.agent",
            pkgutil:   "com.macos-auth.pkg",
            delete:    [
              "/opt/homebrew/bin/macos-auth-agent",
              "/opt/homebrew/share/doc/macos-auth",
              "/opt/homebrew/share/macos-auth",
            ]

  caveats <<~EOS
    macos-auth installs the agent binary and helper scripts only.
    It does not create agent keys, host allowlists, or a per-user LaunchAgent automatically.

    After preparing an agent config, install the LaunchAgent with:
      /opt/homebrew/share/macos-auth/scripts/install-launchagent.sh \
        --agent-bin /opt/homebrew/bin/macos-auth-agent \
        --config "$HOME/Library/Application Support/macos-auth/agent-config.json"

    Check status with:
      /opt/homebrew/share/macos-auth/scripts/status-launchagent.sh

    Unload with:
      /opt/homebrew/share/macos-auth/scripts/uninstall-launchagent.sh --keep-plist
  EOS
end
