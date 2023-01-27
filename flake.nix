{
  description = "Yaksis' NisOS configuration flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nur,
    nix-doom-emacs,
    ...
  } @ inputs: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations.yaksis-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [
        home-manager.nixosModule
        nur.nixosModules.nur
        ./host
      ];
    };
  };
}
