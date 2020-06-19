cask 'onscreen-control' do
  version '3.90'
  sha256 '99ac797ddd5c082902412cf428a3284c5fc56293d16e134f59f22018c7d223c1'

  url 'http://gscs-b2c.lge.com/downloadFile?fileId=oUPWP5KHNfrF9pvvVc36lQ'
  appcast 'https://www.lg.com/us/support/software-firmware-drivers'
  name 'LG OnScreel Control'
  homepage 'https://www.lg.com/'

  pkg 'OSC_V3.90_signed.pkg'

  uninstall pkgutil: [
                       'com.OSCMultiMonitor.pkg',
                       'com.OSC_Directory.pkg',
                       'com.OSC_Library.pkg',
                       'com.OSCApp.pkg',
                     ]
end
