{
  config,
  inputs,
  ...
}: {
  flake.nixosConfigurations.yaksis-dell-desktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [
      config.flake.modules.nixos.nix

      {
        imports = [
          ./_hardware.nix
          ./_boot.nix
          ./_mount.nix
          ../../../system
          ../../../home
        ];
      }

      ({pkgs, ...}: {
        nix.channel.enable = false;

        nix.registry.pkgs.flake = inputs.nixpkgs;

        hardware.opengl = {
          enable = true;
          driSupport = true;
          driSupport32Bit = true;
          extraPackages = [
            pkgs.intel-media-driver
            pkgs.mesa.drivers
          ];
        };

        hardware.bluetooth.enable = true;

        # Copy the NixOS configuration file and link it from the resulting system
        # (/run/current-system/configuration.nix). This is useful in case you
        # accidentally delete configuration.nix.
        # system.copySystemConfiguration = true;

        # This value determines the NixOS release from which the default
        # settings for stateful data, like file locations and database versions
        # on your system were taken. It‘s perfectly fine and recommended to leave
        # this value at the release version of the first install of this system.
        # Before changing this value read the documentation for this option
        # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
        system.stateVersion = "22.11"; # Did you read the comment?
      })
    ];
  };
}
