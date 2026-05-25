# Before publishing, replace every TODO / placeholder below with real values:
#   version  -> released version, without a leading "v"
#   url      -> must match the EXACT asset name on the GitHub release
#   sha256   -> `shasum -a 256 <downloaded-tarball>` for each arch
cask "shuck" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.0"
  sha256 arm:   "0000000000000000000000000000000000000000000000000000000000000000",
         intel: "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/justanotherspy/shuck/releases/download/v#{version}/shuck-#{version}-darwin-#{arch}.tar.gz",
      verified: "github.com/justanotherspy/shuck/"
  name "shuck"
  desc "TODO: one-line description of shuck"
  homepage "https://github.com/justanotherspy/shuck"

  livecheck do
    url :url
    strategy :github_latest
  end

  # If the tarball extracts into a subdirectory, point at the binary inside it,
  # e.g. binary "shuck-#{version}-darwin-#{arch}/shuck"
  binary "shuck"

  zap trash: "~/.config/shuck"
end
