{
  nix-index-database,
  nur,
  catppuccin,
  specialArgs,
  ...
}: {
  home-manager.users.yakkhini = {nixpkgs-unfree, ...}: {
    imports = [
      nix-index-database.homeModules.nix-index
      ./programs
      ./packages.nix
    ];
  };
}
