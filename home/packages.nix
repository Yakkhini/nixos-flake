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
    pkgs.nautilus

    # Tool (tlp for powersave, ncdu for disk management)
    pkgs.p7zip
    pkgs.alejandra

    # Browsers
    pkgs.firefox

    # Chat
    pkgs.tdesktop
    config.nur.repos.linyinfeng.wemeet
    pkgs.feishu
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

    #Code
    pkgs.gnumake
    pkgs.poetry
    pkgs.nixd
    pkgs.clang
    pkgs.clang-tools

    # Security
    pkgs.gopass
    pkgs.gopass-jsonapi

    (pkgs.steam.override {
      extraPkgs = pkgs: [pkgs.source-han-sans]; # Add no-vf CJK fonts to show CJK characters correctly
    })
  ];
}
