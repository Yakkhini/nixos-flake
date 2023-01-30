{
  lib,
  pkgs,
  nix-doom-emacs,
  ...
}: {
  programs.doom-emacs = rec {
    enable = true;
    doomPrivateDir = ../config/doom.d;

    # Only init/packages so we only rebuild when those change.
    doomPackageDir = pkgs.linkFarm "doom-packages-dir" [
      {
        name = "init.el";
        path = ../config/doom.d/init.el;
      }
      {
        name = "packages.el";
        path = ../config/doom.d/packages.el;
      }
      {
        name = "config.el";
        path = pkgs.emptyFile;
      }
    ];
  };
}
