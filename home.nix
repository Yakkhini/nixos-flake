{
  config,
  lib,
  pkgs,
  nixpkgs,
  nixvim,
  home-manager,
  catppuccin,
  nur,
  vscode-server,
  specialArgs,
  ...
}: {
  home.stateVersion = "22.11";
  imports = [
    ./programs/minimal.nix
    ./packages-minimal.nix
  ];

  catppuccin.flavor = "mocha";

  services.vscode-server.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
