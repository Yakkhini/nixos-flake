{
  description = "Yaksis' NisOS configuration flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
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
      url = "github:nix-community/home-manager/master";
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
    nixos-hardware,
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
    nixosConfigurations.yaksis-thinkbook-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [
        home-manager.nixosModule
        nur.nixosModules.nur
        "${nixos-hardware}/common/cpu/intel"
        "${nixos-hardware}/common/gpu/intel"
        "${nixos-hardware}/common/pc/laptop"
        "${nixos-hardware}/common/pc/laptop/acpi_call.nix"
        "${nixos-hardware}/common/pc/laptop/ssd"
        "${nixos-hardware}/common/hidpi.nix"
        ./hosts/thinkbook-desktop
      ];
    };
  };
}
