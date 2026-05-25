# homebrew-tap

A [Homebrew](https://brew.sh) tap for my projects.

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

| Cask | Description |
| ---- | ----------- |
| [`sproot`](Casks/sproot.rb) | TODO: one-line description |
| [`shuck`](Casks/shuck.rb)   | TODO: one-line description |
| [`garlic`](Casks/garlic.rb) | TODO: one-line description |

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

## Maintaining casks

Each cask in [`Casks/`](Casks) ships a macOS CLI binary tarball from its
project's GitHub Releases. When you cut a new release, update three fields in
the cask and commit:

1. `version` — the new release version (without the leading `v`).
2. `url` — confirm it still matches the exact release asset name.
3. `sha256` — checksum per architecture:

   ```sh
   shasum -a 256 sproot-<version>-darwin-arm64.tar.gz
   shasum -a 256 sproot-<version>-darwin-x86_64.tar.gz
   ```

Validate locally before pushing:

```sh
brew style justanotherspy/tap
brew audit --cask --online justanotherspy/tap/sproot
brew install --cask justanotherspy/tap/sproot
```
