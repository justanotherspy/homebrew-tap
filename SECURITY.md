# Security

This repository is a [Homebrew](https://brew.sh) tap: a distribution point that
decides what software lands on a user's machine when they run
`brew install --cask justanotherspy/tap/<name>`. Anyone who can push to `main`
can change what those users download and execute, so the tap is part of our
software supply chain and is treated accordingly.

## Trust chain

Casks in [`Casks/`](Casks) are **not hand-edited**. Each is generated and pushed
here by its source project's release pipeline:

| Cask | Source repo | How it's published |
| ---- | ----------- | ------------------ |
| `garlic` | [justanotherspy/garlic](https://github.com/justanotherspy/garlic) | Release-workflow job renders the cask and pushes it here |
| `shuck`  | [justanotherspy/shuck](https://github.com/justanotherspy/shuck)   | GoReleaser `homebrew_casks` |
| `sproot` | [justanotherspy/sproot](https://github.com/justanotherspy/sproot) | GoReleaser `homebrew_casks` |

Each source repo authenticates with a `HOMEBREW_TAP_GITHUB_TOKEN` that has
`contents:write` on this repo, and a release only flips to "Latest" once its
binaries and the cask are both in place — so the tap never points at a
half-published release.

## Integrity guarantees in every cask

These are the controls that protect end users and **must be present** in any
cask published here:

- **Per-artifact `sha256`.** Homebrew refuses to install if the downloaded
  archive does not match the pinned hash. This is the primary tamper check.
- **`verified:` host pinning** on every `url`, tying each download to the
  expected `github.com/justanotherspy/...` namespace.

The [`Audit casks`](.github/workflows/audit-casks.yml) workflow re-validates
these on every push to `main` and on every pull request. The blocking check is
`brew audit --cask --online`, whose `--online` pass re-fetches each artifact and
re-checks its URL and `sha256`. `brew style` also runs but is *informational*
(non-blocking): the casks are auto-generated upstream and must not be
hand-edited, so cosmetic style drift is surfaced without failing the build.
Because casks are pushed straight to `main`, this is a *detective* control — it
surfaces a bad or tampered cask quickly, but does not block the push.

## Gatekeeper / code signing

`brew audit` aside, the strongest end-user protection on macOS is a
**code-signed and notarized** binary. When binaries are notarized, casks do not
need to strip the `com.apple.quarantine` attribute in `postflight`
(`xattr -dr com.apple.quarantine ...`). That stanza disables the Gatekeeper
check that would otherwise verify a downloaded binary, so prefer signing and
notarizing upstream and dropping the `xattr` call.

This is upstream work in each source repo's release pipeline, not in this tap.

## Recommended repository settings

These are configured in repository settings, not in files here:

- **Secret scanning + push protection**: enabled, so a leaked
  `HOMEBREW_TAP_GITHUB_TOKEN` or other credential is caught before it lands.
- **Branch protection on `main`**: block force-pushes and deletions and require
  linear history. (These are compatible with the automated push-to-`main`
  flow; requiring pull-request review is not, unless auto-merge is wired up.)
- **Publishing token**: prefer a short-lived **GitHub App installation token**
  scoped to this repo over a long-lived PAT. If a PAT is used, it must be
  fine-grained, limited to this single repo, and granted only `contents:write`.

## Reporting a vulnerability

If you find a security issue in this tap or in one of the published casks,
please open a private security advisory on the relevant repository rather than
a public issue.
