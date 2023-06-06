{
  config,
  pkgs,
  hyprland,
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

    # Shell
    pkgs.tilix

    # Browsers
    pkgs.firefox

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

    # Study
    pkgs.anki-bin
    pkgs.gnome.pomodoro

    #Code
    pkgs.julia-lts-bin
    pkgs.poetry

    # Security
    pkgs.gopass
    pkgs.gopass-jsonapi
  ];
}
