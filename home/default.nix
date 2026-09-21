{
  nix-index-database,
  nur,
  catppuccin,
  niri,
  specialArgs,
  ...
}: {
  home-manager.users.yakkhini = {nixpkgs-unfree, ...}: {
    imports = [
      niri.homeModules.niri
      nix-index-database.homeModules.nix-index
      ./programs
      ./packages.nix
      ./services.nix
      ./waylandSway.nix
      ./waylandNiri
    ];
  };
}
