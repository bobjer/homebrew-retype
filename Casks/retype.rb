cask "retype" do
  version "1.2.1"
  sha256 "334cc5f34a6a62d38dacc29a0b1be67aad8eedb156524c32ab2b3c9b006fa372"

  url "https://github.com/bobjer/retype/releases/download/v#{version}/Retype-#{version}.zip"
  name "Retype"
  desc "Convert mistyped text between keyboard layouts with a hotkey"
  homepage "https://github.com/bobjer/retype"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Retype.app"

  # Remove Gatekeeper quarantine — app is ad-hoc signed (no Apple Developer ID)
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-r", "-d", "com.apple.quarantine", "{{appdir}}/Retype.app"]
  end
end
