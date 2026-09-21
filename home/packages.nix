{
  pkgs,
  zen-browser,
  ...
}: {
  home.packages = [
    # Tool
    pkgs.just
    pkgs.kalker # Calculator
    pkgs.p7zip
    pkgs.alejandra
    pkgs.ueberzugpp # Image Preview for alacritty
    pkgs.hydra-check # Check the status of hydra jobs
    pkgs.podman-tui
    pkgs.podman-compose

    # Browsers
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Communication
    pkgs.telegram-desktop
    pkgs.wemeet
    pkgs.feishu
    pkgs.nur.repos.yakkhini.dingtalk
    pkgs.wechat
    pkgs.thunderbird

    # Media
    pkgs.nur.repos.yakkhini.vutronmusic
    pkgs.cider-2
    pkgs.tsukimi
    pkgs.pavucontrol
    pkgs.nomacs # Images viewer
    pkgs.kdePackages.okular # PDF reader
    pkgs.vlc

    # Writing
    pkgs.obsidian
    pkgs.vscode-fhs
    pkgs.zotero
    pkgs.typst
    pkgs.tinymist
    pkgs.typstyle
  ];
}
