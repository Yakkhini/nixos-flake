{
  config,
  inputs,
  ...
}: {
  flake.modules.nixos.common = {pkgs, ...}: {
    imports = [
      inputs.catppuccin.nixosModules.catppuccin

      config.flake.modules.nixos.nix

      config.flake.modules.nixos.users
      config.flake.modules.nixos.network
      config.flake.modules.nixos.fonts
      config.flake.modules.nixos.i18n
    ];

    # Set your time zone.
    time.timeZone = "Asia/Shanghai";

    # Documentation.
    documentation.enable = true;

    documentation.dev.enable = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      android-tools
      nixd
      man-pages
      man-pages-posix
      cifs-utils
      fastfetch
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      ranger
      ncdu
      btop
      brightnessctl
      ddcutil
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    programs = {
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryPackage = pkgs.pinentry-qt;
      };
      git.enable = true;
      zsh.enable = true;
      dconf.enable = true;
      yazi.enable = true;
    };

    catppuccin.enable = true;
    catppuccin.autoEnable = false;
    catppuccin.cache.enable = true;

    # Home Manager
    home-manager.users.yakkhini = {};

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

      config.flake.modules.homeManager.shell
      config.flake.modules.homeManager.simple-editor
      config.flake.modules.homeManager.ssh
      config.flake.modules.homeManager.vcs
    ];

    home.packages = [
      pkgs.pipes-rs # Just for fun
      pkgs.sl
      pkgs.cowsay

      # Tool
      pkgs.just
      pkgs.kalker # Calculator
      pkgs.p7zip
      pkgs.alejandra
      pkgs.hydra-check # Check the status of hydra jobs
      pkgs.podman-tui
      pkgs.podman-compose

      # Security
      pkgs.gopass
      pkgs.gopass-jsonapi
    ];

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;
    };

    programs.rclone.enable = true;

    catppuccin.enable = true;
    catppuccin.autoEnable = false;
    catppuccin.flavor = "mocha";

    home.stateVersion = "22.11";
  };
}
