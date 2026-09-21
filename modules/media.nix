{...}: {
  flake.modules.homeManager.media = {pkgs, ...}: {
    home.packages = [
      pkgs.nur.repos.yakkhini.vutronmusic
      pkgs.cider-2
      pkgs.tsukimi
      pkgs.pavucontrol
      pkgs.nomacs # Images viewer
      pkgs.kdePackages.okular # PDF reader
      pkgs.vlc
    ];
  };
}
