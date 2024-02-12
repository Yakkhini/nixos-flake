{
  config,
  lib,
  pkgs,
  nixpkgs,
  home-manager,
  nur,
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
    nix.registry.pkgs.flake = nixpkgs;
    home.stateVersion = "22.11";
    imports = [
      nur.nixosModules.nur
      ./programs
      ./nixpkgs.nix
      ./packages.nix
      ./services.nix
    ];

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };

    gtk = {
      enable = true;
      theme.name = "Orchis-Red";
      iconTheme.name = "Papirus";
      cursorTheme.name = "Bibata-Original-Classic";
      cursorTheme.size = 32;
      font.name = "PT Sans Caption";
      font.size = 14;
    };
  };
}
