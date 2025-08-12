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
  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = true;

  home-manager.extraSpecialArgs = specialArgs;

  home-manager.users.yakkhini = {
    pkgs,
    nixpkgs,
    ...
  }: {
    home.stateVersion = "22.11";
    imports = [
      catppuccin.homeModules.catppuccin
      nixvim.homeModules.nixvim
      nur.modules.homeManager.default
      vscode-server.nixosModules.home
      ./programs/minimal.nix
      ./packages-minimal.nix
    ];

    catppuccin.flavor = "mocha";

    services.vscode-server.enable = true;

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
