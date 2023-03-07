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
    pkgs.swaylock # additional config: security.pam.services.swaylock
    pkgs.bemenu
    pkgs.hyprpaper
    pkgs.sway-contrib.grimshot
    pkgs.grim
    pkgs.wlogout
    ## icons & themes
    pkgs.pipes-rs # Just for fun
    pkgs.viu
    pkgs.vanilla-dmz
    pkgs.orchis-theme
    pkgs.papirus-folders
    pkgs.papirus-icon-theme
    ## others
    pkgs.gnome.nautilus

    # Shell
    pkgs.tilix

    # Browsers
    pkgs.firefox
    pkgs.brave

    # Chat
    pkgs.neomutt
    pkgs.msmtp
    pkgs.tdesktop

    # Media
    pkgs.pavucontrol
    pkgs.nomacs # Images viewer
    pkgs.okular # PDF reader

    # Writing
    pkgs.texlive.combined.scheme-full
    pkgs.vscode-fhs
    pkgs.logseq
    pkgs.zotero

    # Security
    pkgs.gopass
  ];
}
