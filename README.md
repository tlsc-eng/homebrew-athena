# tlsc-eng/homebrew-athena

Homebrew tap for [Athena](https://github.com/tlsc-eng/athena), a personal macOS IDE.

```sh
brew tap tlsc-eng/athena
brew install --cask athena
```

Apple silicon, macOS 26 or later. The app is ad-hoc signed (no Developer ID yet), so the cask clears its quarantine flag after install.

`Casks/athena.rb` is written by `scripts/release.sh` in the Athena repository; do not edit it by hand.
