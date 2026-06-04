cask "aerospace-ghostty-tabs" do
  version "0.0.0-ghostty-tabs-d9a5c324"
  sha256 "5634302564fdc11cddc6ffdb11adde939849c28c87dd9a597a1738c520bc715b"

  url "https://github.com/lucasoskorep/AeroSpace/releases/download/#{version}/AeroSpace-v#{version}.zip"
  name "AeroSpace Ghostty Tabs"
  homepage "https://github.com/lucasoskorep/AeroSpace"

  conflicts_with cask: ["aerospace", "aerospace-dev"]
  depends_on macos: ">= :ventura"

  package_root = "AeroSpace-v#{version}"

  app "#{package_root}/AeroSpace.app"
  binary "#{package_root}/bin/aerospace"
  bash_completion "#{package_root}/shell-completion/bash/aerospace"
  zsh_completion "#{package_root}/shell-completion/zsh/_aerospace"
  fish_completion "#{package_root}/shell-completion/fish/aerospace.fish"
  Dir["#{package_root}/manpage/*.1"].sort.each do |page|
    manpage page
  end

  postflight do
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{staged_path}/#{package_root}/bin/aerospace"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{appdir}/AeroSpace.app"
  end
end
