cask "athena" do
  version "0.1.0"
  sha256 "b20366b1db77f6c051bda5a013ae0afdd44cc572cd1aee73027dc21d3915414d"

  url "https://github.com/tlsc-eng/athena/releases/download/v#{version}/Athena-#{version}-arm64.zip"
  name "Athena"
  desc "Personal IDE with persistent terminals and Claude Code integration"
  homepage "https://github.com/tlsc-eng/athena"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Athena.app"
  binary "#{appdir}/Athena.app/Contents/MacOS/athena"

  # Ad-hoc signed, with no Developer ID: Gatekeeper refuses a quarantined copy outright.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Athena.app"],
        writable_paths: ["Athena.app"],
        writable_base:  :appdir
  end

  uninstall quit: "io.tlsc.athena"

  zap trash: "~/Library/Application Support/athena"
end
