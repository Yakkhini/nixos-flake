{
  config,
  lib,
  pkgs,
  nixpkgs,
  home-manager,
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
    nix.registry.pkgs.flake = nixpkgs;
    home.stateVersion = "22.11";
    imports = [
      nur.nixosModules.nur
      vscode-server.nixosModules.home
      ./programs/minimal.nix
      ./packages-minimal.nix
    ];

    services.vscode-server.enable = true;

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
