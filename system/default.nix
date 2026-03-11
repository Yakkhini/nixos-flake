{
  config,
  lib,
  pkgs,
  nur,
  ...
}: {
  imports = [
    ./base.nix
    ./vpn.nix
    ./display.nix
    ./users.nix
    ./network.nix
    ./i18n.nix
    ./fonts.nix
    ./pkgs.nix
  ];
}
