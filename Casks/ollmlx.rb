cask "ollmlx" do
  version "0.1.0"
  sha256 "817026e8412d911ba017968ee6394da10b8182db78aa9390323132d73ee912e9"

  url "https://github.com/darrylmorley/ollmlx/releases/download/v#{version}/ollmlx-#{version}.dmg"
  name "ollmlx"
  desc "Run local LLMs on Apple Silicon via mlx-lm with an Ollama-compatible API"
  homepage "https://github.com/darrylmorley/ollmlx"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "OllmlxApp.app"

  binary "#{appdir}/OllmlxApp.app/Contents/MacOS/OllmlxApp", target: "ollmlx"

  zap trash: [
    "~/.ollmlx",
    "~/Library/Preferences/com.darrylmorley.ollmlx.plist",
    "~/Library/Application Support/ollmlx",
    "~/Library/Logs/ollmlx",
  ]
end
