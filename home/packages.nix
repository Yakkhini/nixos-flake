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

    # Browsers
    pkgs.firefox

    # Chat
    pkgs.tdesktop
    pkgs.qq

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
    pkgs.gnome.pomodoro

    #Code
    pkgs.gnumake
    pkgs.julia-lts-bin
    pkgs.poetry
    pkgs.clang
    pkgs.clang-tools

    # Security
    pkgs.gopass
    pkgs.gopass-jsonapi
  ];
}
