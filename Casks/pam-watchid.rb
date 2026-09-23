cask "pam-watchid" do
  version "0.2.1"
  native_arm = Hardware::CPU.physical_cpu_arm64?
  native_arch = native_arm ? "arm64" : "x86_64"
  sha256 native_arm ? "429443e4ad36ca0fc2dc16eb1a3ecfabd2f2945478985151526337abdcb452d3" : "f0feb0879349bf4b05d0e4b1c00fc086a9b906e184c0075905a6c6b19ee756a1"

  url "https://github.com/rioriost/pam_watchid/releases/download/v#{version}/pam-watchid-#{version}-#{native_arch}.pkg"
  name "pam_watchid"
  desc "Approve sudo using Touch ID or Apple Watch"
  homepage "https://github.com/rioriost/pam_watchid"

  disable! date: "2026-09-23", because: "the Homebrew upgrade uninstall hook can stall"

  supported_macos = [:sequoia, :tahoe]
  supported_macos << :golden_gate if native_arm
  depends_on macos: supported_macos

  pkg "pam-watchid-#{version}-#{native_arch}.pkg"

  # The package's uninstaller owns PAM cleanup before removing its payload.
  uninstall script: {
    executable: "/Library/Security/pam_watchid/uninstall.sh",
    sudo: true,
    must_succeed: true,
  }

  caveats <<~EOS
    Installation automatically enables pam_watchid in sudo_local after backing
    it up under /private/var/db/pam_watchid. Existing authentication is preserved.
    Uninstall removes only the installer-managed entry; backups are retained.
    Before upgrading a manually activated 0.1.1, remove its manual PAM entry.
    Native-architecture sudo is required.
  EOS
end
