cask "retype" do
  version "1.2"
  sha256 "92e3a7d5aad3df5a4545e862b6a5ad9656431deebe637e8e66ea81088a9b1e81"

  url "https://github.com/bobjer/retype/releases/download/v#{version}/Retype-#{version}.zip"
  name "Retype"
  desc "Convert mistyped text between keyboard layouts with a hotkey"
  homepage "https://github.com/bobjer/retype"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Retype.app"

  # Remove Gatekeeper quarantine — app is ad-hoc signed (no Apple Developer ID)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/Retype.app"],
                   sudo: false
  end
end
