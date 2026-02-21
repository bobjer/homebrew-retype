cask "retype" do
  version "1.1"
  sha256 "2f769d185389ef7f021d7fc9948087e4dd661e163556812e5f62e511cff95c9b"

  url "https://github.com/bobjer/retype/releases/download/v#{version}/Retype-#{version}.zip"
  name "Retype"
  desc "Convert mistyped text between keyboard layouts with a hotkey"
  homepage "https://github.com/bobjer/retype"

  depends_on macos: ">= :ventura"

  app "Retype.app"

  # Remove Gatekeeper quarantine — app is ad-hoc signed (no Apple Developer ID)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/Retype.app"],
                   sudo: false
  end
end
