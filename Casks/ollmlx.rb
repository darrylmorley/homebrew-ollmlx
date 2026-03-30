cask "ollmlx" do
  version "0.1.0"
  sha256 "7222a08d18b160d568d08540fd22206b9eade7d541053a9cc3def5e0bf761fcf"

  url "https://github.com/darrylmorley/ollmlx/releases/download/v#{version}/ollmlx-#{version}.dmg"
  name "ollmlx"
  desc "Run local LLMs on Apple Silicon via mlx-lm with an Ollama-compatible API"
  homepage "https://github.com/darrylmorley/ollmlx"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "ollmlx.app"

  shimscript = "#{staged_path}/ollmlx.sh"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec "/Applications/ollmlx.app/Contents/MacOS/ollmlx" "$@"
    EOS
  end

  binary shimscript, target: "ollmlx"

  zap trash: [
    "~/.ollmlx",
    "~/Library/Preferences/com.darrylmorley.ollmlx.plist",
    "~/Library/Application Support/ollmlx",
    "~/Library/Logs/ollmlx",
  ]
end