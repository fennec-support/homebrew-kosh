# Homebrew tap for Koshka

This tap installs the prebuilt `kosh` binary from the
[fennec-support/kosh](https://github.com/fennec-support/kosh) releases.

```sh
brew install fennec-support/kosh/kosh
```

The command taps `fennec-support/kosh` on first use.

## Platforms

| Platform | Release asset |
|---|---|
| macOS on Apple silicon | `kosh-darwin-aarch64-<version>` |
| Linux on x86-64 | `kosh-linux-amd64-<version>` |
| Linux on arm64 | `kosh-linux-aarch64-<version>` |

No release is built for macOS on Intel, so the formula refuses to install
there.

## Updates

The formula reads the newest release tag from GitHub each time Homebrew loads
it, and takes each asset's checksum from that release's `SHA256SUMS` file. A
new kosh release reaches `brew upgrade` without a change to this repository.

Homebrew needs network access to load the formula.

## License

BSD 3-Clause. See [LICENSE](LICENSE).
