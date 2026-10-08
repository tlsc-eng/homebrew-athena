cask "athena" do
  version "0.3.0"
  sha256 "08062e5dafcb91b9939bac2a4f1b9866f0078f03bba98a61cace4cab3db7c4f0"

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

  # Not in uninstall: upgrades run that stanza, and must leave running shells alone.
  # By zap time the app is back in the staged path, so the relative executable resolves.
  zap script: {
        executable:   "Athena.app/Contents/MacOS/athena",
        args:         ["mux", "stop"],
        must_succeed: false,
      },
      trash:  "~/Library/Application Support/athena"
end
