cask "aerospace-ghostty-tabs" do
  version "0.0.0-ghostty-tabs-05bbb8f8"
  sha256 "bee4e7dca9410a2832507e2877a411d94d4c7cc0c14e1937d994df4991b3390f"

  url "https://github.com/lucasoskorep/AeroSpace/releases/download/#{version}/AeroSpace-v#{version}.zip"
  name "AeroSpace Ghostty Tabs"
  homepage "https://github.com/lucasoskorep/AeroSpace"

  conflicts_with cask: ["aerospace", "aerospace-dev"]
  depends_on macos: ">= :ventura"

  package_root = "AeroSpace-v#{version}"

  app "#{package_root}/AeroSpace.app"
  binary "#{package_root}/bin/aerospace"
  bash_completion "#{package_root}/shell-completion/bash/aerospace"
  fish_completion "#{package_root}/shell-completion/fish/aerospace.fish"
  zsh_completion "#{package_root}/shell-completion/zsh/_aerospace"

  Dir["#{package_root}/manpage/*.1"].each do |page|
    manpage page
  end

  postflight do
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{staged_path}/#{package_root}/bin/aerospace"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{appdir}/AeroSpace.app"
  end
end
