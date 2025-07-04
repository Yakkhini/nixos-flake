{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    # Desktop Env
    ## Wayland
    pkgs.wl-clipboard
    pkgs.wlsunset
    pkgs.swayidle
    pkgs.hypridle
    pkgs.hyprlock
    pkgs.hyprpaper
    pkgs.sway-contrib.grimshot
    pkgs.grim
    pkgs.xwayland-satellite
    ## hyprwm contrib
    pkgs.grimblast
    ## icons & themes
    pkgs.pipes-rs # Just for fun
    pkgs.sl
    pkgs.cowsay
    pkgs.viu
    pkgs.vanilla-dmz
    pkgs.orchis-theme
    ## others
    pkgs.nautilus

    # Tool
    pkgs.kalker # Calculator
    pkgs.p7zip
    pkgs.alejandra
    pkgs.ueberzugpp # Image Preview for alacritty
    pkgs.hydra-check # Check the status of hydra jobs
    pkgs.podman-tui
    pkgs.podman-compose

    # Browsers
    pkgs.firefox

    # Communication
    pkgs.tdesktop
    pkgs.wemeet
    pkgs.feishu
    pkgs.qq
    pkgs.wechat-uos
    pkgs.discord
    pkgs.thunderbird

    # Media
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

    #Code
    pkgs.ruby
    pkgs.ruby.gems.solargraph
    pkgs.gnumake
    pkgs.uv
    pkgs.ruff
    pkgs.nixd
    pkgs.clang
    pkgs.clang-tools

    # Security
    pkgs.gopass
    pkgs.gopass-jsonapi
  ];
}
