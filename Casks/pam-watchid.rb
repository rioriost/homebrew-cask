cask "pam-watchid" do
  version "0.1.1"
  native_arm = Hardware::CPU.physical_cpu_arm64?
  native_arch = native_arm ? "arm64" : "x86_64"
  sha256 native_arm ? "7a24a4452929f6042cca4cd06cfc9e0f8f551fb9c90e68606541d464bff7f691" : "7f0bb16c795c16bf9f1667c621fa87df334fbde2ccdef0236b00a9b364352641"

  url "https://github.com/rioriost/pam_watchid/releases/download/v#{version}/pam-watchid-#{version}-#{native_arch}.pkg"
  name "pam_watchid"
  desc "Approve sudo using Touch ID or Apple Watch"
  homepage "https://github.com/rioriost/pam_watchid"

  supported_macos = [:sequoia, :tahoe]
  supported_macos << :golden_gate if native_arm
  depends_on macos: supported_macos

  pkg "pam-watchid-#{version}-#{native_arch}.pkg"

  # The script checks PAM before touching payloads or the receipt, including on upgrade.
  uninstall script: {
    executable: "/Library/Security/pam_watchid/uninstall.sh",
    sudo: true,
    must_succeed: true,
  }

  caveats <<~EOS
    Installation does not activate PAM. Follow the project's manual activation
    instructions, preserving password fallback. Remove the pam_watchid PAM entry
    manually before upgrading or uninstalling. Native-architecture sudo is required.
  EOS
end
