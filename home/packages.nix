{
  config,
  nur,
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
    pkgs.bemenu
    pkgs.hyprpaper
    pkgs.sway-contrib.grimshot
    pkgs.grim
    pkgs.wlogout
    ## hyprwm contrib
    pkgs.grimblast
    ## icons & themes
    pkgs.pipes-rs # Just for fun
    pkgs.viu
    pkgs.vanilla-dmz
    pkgs.orchis-theme
    pkgs.papirus-folders
    pkgs.papirus-icon-theme
    ## others
    pkgs.gnome.nautilus

    # Tool (tlp for powersave, ncdu for disk management)

    # Browsers
    pkgs.firefox

    # Chat
    pkgs.tdesktop
    config.nur.repos.linyinfeng.wemeet
    pkgs.qq
    pkgs.wechat-uos # license needed

    # Media
    pkgs.pavucontrol
    pkgs.nomacs # Images viewer
    pkgs.okular # PDF reader
    pkgs.vlc

    # Writing
    pkgs.neovide
    pkgs.vscode-fhs
    pkgs.zotero

    # Study
    pkgs.gnome.pomodoro

    #Code
    pkgs.gnumake
    pkgs.poetry
    pkgs.nixd
    pkgs.clang
    pkgs.clang-tools

    # Security
    pkgs.gopass
    pkgs.gopass-jsonapi

    pkgs.steam
  ];
}
