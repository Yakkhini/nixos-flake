{
  config,
  lib,
  pkgs,
  nur,
  ...
}: {
  imports = [
    ./users.nix
    ./network.nix
    # ./i18n.nix
    ./fonts.nix
    ./pkgs.nix
  ];
}
