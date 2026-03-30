cask "ollmlx" do
  version "0.1.0"
  sha256 "e36d7662369e27dff525fadbd3350a4549f05f82f57d500d393762ac60b4b5de"

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