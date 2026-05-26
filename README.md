# homebrew-tap

A [Homebrew](https://brew.sh) tap for my command-line tools.

## Usage

Add the tap once:

```sh
brew tap justanotherspy/tap
```

Then install any of the casks below:

```sh
brew install --cask justanotherspy/tap/sproot
```

After the tap is added you can also use the short name, e.g. `brew install --cask sproot`.

## Available casks

| Cask | Description | Platforms |
| ---- | ----------- | --------- |
| [`garlic`](Casks/garlic.rb) | Track active coding time with Claude Code and nudge yourself to take breaks | macOS |
| [`shuck`](Casks/shuck.rb)   | Print the exact failing CI step logs for a GitHub PR | macOS, Linux |
| [`sproot`](Casks/sproot.rb) | Bootstrap sprite.dev sprites from a user-owned config repo | macOS, Linux |

The casks ship the prebuilt release binary for your OS/architecture. `garlic` is
macOS-only (its Linux release artifacts aren't published consistently); on Linux
install it with `cargo install garlic-ward`.

## Updating

```sh
brew update
brew upgrade --cask sproot
```

## Uninstalling

```sh
brew uninstall --cask sproot
brew untap justanotherspy/tap   # remove the tap entirely
```

## How the casks are maintained

**Don't hand-edit the casks in [`Casks/`](Casks).** Each one is regenerated and
pushed here automatically by its source project's release pipeline whenever a new
release is published:

| Cask | Source repo | How it's published |
| ---- | ----------- | ------------------ |
| `garlic` | [justanotherspy/garlic](https://github.com/justanotherspy/garlic) | A release-workflow job renders the cask and pushes it here |
| `shuck`  | [justanotherspy/shuck](https://github.com/justanotherspy/shuck)   | GoReleaser `homebrew_casks` |
| `sproot` | [justanotherspy/sproot](https://github.com/justanotherspy/sproot) | GoReleaser `homebrew_casks` |

Each source repo authenticates to this repo with a `HOMEBREW_TAP_GITHUB_TOKEN`
secret (a token with `contents:write` on `justanotherspy/homebrew-tap`). The
release only flips to "Latest" once its binaries and this cask are in place, so
the tap never points at a half-published release.

If you ever need to validate a cask locally:

```sh
brew style justanotherspy/tap
brew audit --cask --online justanotherspy/tap/sproot
brew install --cask justanotherspy/tap/sproot
```
