cask "ollmlx" do
  version "0.1.0"
  sha256 "9d7c99954288c2da70ec3563ec72dd65b384a049eff2d4aff7bcd5943f70b762"

  url "https://github.com/darrylmorley/ollmlx/releases/download/v#{version}/ollmlx-#{version}.dmg"
  name "ollmlx"
  desc "Run local LLMs on Apple Silicon via mlx-lm with an Ollama-compatible API"
  homepage "https://github.com/darrylmorley/ollmlx"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "ollmlx.app"
  binary "#{appdir}/ollmlx.app/Contents/MacOS/ollmlx-cli", target: "ollmlx"

  zap trash: [
    "~/.ollmlx",
    "~/Library/Preferences/com.darrylmorley.ollmlx.plist",
    "~/Library/Application Support/ollmlx",
    "~/Library/Logs/ollmlx",
  ]
end