cask "ollmlx" do
  version "0.1.1"
  sha256 "dcb14e854aab99f95b0ea127da71981009bc47c237550def793521ce799944b9"

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