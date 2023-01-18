{pkgs, ...}: {
  home.packages = [
    pkgs.gnome.nautilus
    pkgs.tilix
    pkgs.firefox
    pkgs.brave
    pkgs.gopass
    pkgs.hyprland
    pkgs.grim
    pkgs.texlive.combined.scheme-full
    pkgs.nomacs
    pkgs.okular
    pkgs.wl-clipboard
    pkgs.wlsunset
    pkgs.swayidle
    pkgs.swaylock # additional config: security.pam.services.swaylock
    pkgs.pipes-rs
    pkgs.vscode-fhs
    pkgs.emacs
    pkgs.logseq
    pkgs.sway-contrib.grimshot
    pkgs.wlogout
    pkgs.pavucontrol
    pkgs.viu
    pkgs.vanilla-dmz
    pkgs.hackneyed
    pkgs.orchis-theme
    pkgs.papirus-folders
    pkgs.papirus-icon-theme
  ];
}
