{
  config,
  inputs,
  ...
}: {
  flake.modules.nixos.common = {
    imports = [
      inputs.catppuccin.nixosModules.catppuccin

      config.flake.modules.nixos.nix

      config.flake.modules.nixos.users
      config.flake.modules.nixos.network
      config.flake.modules.nixos.fonts
      config.flake.modules.nixos.pkgs
      config.flake.modules.nixos.i18n
    ];

    # Set your time zone.
    time.timeZone = "Asia/Shanghai";

    # Documentation.
    documentation.enable = true;
    documentation.dev.enable = true;

    # Home Manager
    home-manager.sharedModules = [
      config.flake.modules.homeManager.common
    ];

    home-manager.useGlobalPkgs = false;
    home-manager.useUserPackages = true;

    home-manager.extraSpecialArgs = inputs;
  };

  flake.modules.homeManager.common = {pkgs, ...}: {
    imports = [
      inputs.catppuccin.homeModules.catppuccin
      inputs.nur.modules.homeManager.default

      ../home/nixpkgs.nix
      ../home/programs/bash.nix
      ../home/programs/direnv.nix
      ../home/programs/helix.nix
      ../home/programs/shelltools.nix
      ../home/programs/ssh.nix
      ../home/programs/vcs.nix
      ../home/programs/vim.nix
      ../home/programs/zsh.nix
    ];

    nix.registry.pkgs.flake = inputs.nixpkgs-unfree; # Only use nixpkgs-unfree for registry

    home.packages = [
      # Security
      pkgs.gopass
      pkgs.gopass-jsonapi
    ];

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;
    };

    home.stateVersion = "22.11";
  };
}
