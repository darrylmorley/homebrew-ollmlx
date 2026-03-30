cask "ollmlx" do
  version "0.1.0"
  sha256 "50b3c25775bdfd3fa2d29a010da8002879c95a8f19b4a45f8e6f7bfe324b100b"

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