{
  description = "Yaksis' NisOS configuration flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nur.url = "github:nix-community/NUR";
    wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nur,
    wsl,
    vscode-server,
    hyprwm-contrib,
    ...
  } @ inputs: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    devShells.x86_64-linux.default =
      nixpkgs.legacyPackages.x86_64-linux.mkShell {
      };

    nixosConfigurations.yaksis-dell-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [
        home-manager.nixosModule
        nur.nixosModules.nur
        ./hosts/dell-desktop
      ];
    };

    nixosConfigurations.yaksis-thinkbook-wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [
        home-manager.nixosModule
        nur.nixosModules.nur
        wsl.nixosModules.wsl
        ./hosts/thinkbook-wsl
      ];
    };
  };
}
