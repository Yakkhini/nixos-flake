{...}: {
  home-manager.users.yakkhini = {nixpkgs-unfree, ...}: {
    imports = [
      ./programs
      ./packages.nix
    ];
  };
}
