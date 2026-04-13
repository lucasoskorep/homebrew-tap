cask "aerospace-ghostty-tabs" do
  version "0.0.0-ghostty-tabs-59d56455"
  sha256 "52b7fd4abcc4a45778fc0207aabf5aa4c73f79f3aa366c827df81ae4ede0b93b"

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
  manpage Dir["#{staged_path}/#{package_root}/manpage/*.1"]

  postflight do
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{staged_path}/#{package_root}/bin/aerospace"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", "#{appdir}/AeroSpace.app"
  end
end
