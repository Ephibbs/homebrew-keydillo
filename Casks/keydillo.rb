cask "keydillo" do
  version "0.1.1"
  sha256 "4ffeb6020c6da93d93c2ff9c939ac4c3d5507ceabb3a518633fc0e63cd0fe8bd"

  url "https://github.com/Ephibbs/keydillo/releases/download/v#{version}/keydillo.zip"
  name "keydillo"
  desc "Lets AI coding tools use your API keys without seeing them"
  homepage "https://github.com/Ephibbs/keydillo"

  depends_on macos: :sequoia

  app "keydillo.app"

  uninstall launchctl: "com.studiokillswitch.keydillo.agent",
            quit:      "com.studiokillswitch.keydillo"

  zap trash: [
    "~/.local/bin/kd",
    "~/.local/bin/keydillo",
    "~/Library/Application Support/keydillo",
  ]

  caveats <<~EOS
    To finish setting up:
      1. Open keydillo (it lives in the menu bar).
      2. In its setup, choose Connect to set up Claude Code.

    Or, inside Claude Code, add the plugin instead:
      /plugin marketplace add Ephibbs/keydillo
      /plugin install keydillo@keydillo

    Using Cursor, Codex or another AI tool? Run:
      npx skills add Ephibbs/keydillo

    Then put kd in front of commands that use your keys (kd npm run dev). Claude does this for you.
  EOS
end
