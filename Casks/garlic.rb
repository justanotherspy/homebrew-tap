# Before publishing, replace every TODO / placeholder below with real values:
#   version  -> released version, without a leading "v"
#   url      -> must match the EXACT asset name on the GitHub release
#   sha256   -> `shasum -a 256 <downloaded-tarball>` for each arch
cask "garlic" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.0"
  sha256 arm:   "0000000000000000000000000000000000000000000000000000000000000000",
         intel: "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/justanotherspy/garlic/releases/download/v#{version}/garlic-#{version}-darwin-#{arch}.tar.gz",
      verified: "github.com/justanotherspy/garlic/"
  name "garlic"
  desc "TODO: one-line description of garlic"
  homepage "https://github.com/justanotherspy/garlic"

  livecheck do
    url :url
    strategy :github_latest
  end

  # If the tarball extracts into a subdirectory, point at the binary inside it,
  # e.g. binary "garlic-#{version}-darwin-#{arch}/garlic"
  binary "garlic"

  zap trash: "~/.config/garlic"
end
