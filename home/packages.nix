{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.gnome.nautilus
    pkgs.tilix
    pkgs.firefox
    pkgs.brave
    pkgs.neomutt
    pkgs.msmtp
    pkgs.tdesktop
    pkgs.gopass
    pkgs.grim
    pkgs.texlive.combined.scheme-full
    pkgs.nomacs
    pkgs.okular
    pkgs.wl-clipboard
    pkgs.wlsunset
    pkgs.swayidle
    pkgs.swaylock # additional config: security.pam.services.swaylock
    pkgs.bemenu
    pkgs.hyprpaper

    pkgs.pipes-rs
    pkgs.vscode-fhs
    # pkgs.logseq
    pkgs.sway-contrib.grimshot
    pkgs.wlogout
    pkgs.pavucontrol
    pkgs.viu
    pkgs.vanilla-dmz
    pkgs.orchis-theme
    pkgs.papirus-folders
    pkgs.papirus-icon-theme
    config.nur.repos.YisuiMilena.hmcl-bin
  ];
}
