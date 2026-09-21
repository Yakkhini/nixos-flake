{
  nix-index-database,
  nur,
  catppuccin,
  nixvim,
  niri,
  specialArgs,
  ...
}: {
  home-manager.users.yakkhini = {nixpkgs-unfree, ...}: {
    imports = [
      nixvim.homeModules.nixvim
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
