{
  config,
  inputs,
  ...
}: {
  flake.nixosConfigurations.yaksis-thinkbook-desktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [
      config.flake.modules.nixos.common
      config.flake.modules.nixos.desktop-base

      inputs.nixos-hardware.nixosModules.common-cpu-intel

      {
        imports = [
          ./_hardware.nix
          ./_mount.nix
          ../../../home
        ];
      }

      {
        home-manager.sharedModules = [
          config.flake.modules.homeManager.niri
          config.flake.modules.homeManager.nixvim
        ];
      }

      ({
        lib,
        pkgs,
        ...
      }: {
        # For Mount NTFS disks
        boot.supportedFilesystems = ["ntfs"];

        # Use the systemd-boot EFI boot loader.
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        boot.kernelPackages = pkgs.linuxPackages_latest;

        powerManagement = {
          enable = true;
        };

        nix.channel.enable = false;

        catppuccin.enable = true;
        catppuccin.autoEnable = false;
        catppuccin.cache.enable = true;

        services.thermald.enable = lib.mkDefault true;
        services.upower.enable = true;

        virtualisation.libvirtd.enable = true;
        programs.virt-manager.enable = true;

        # Steam need 32bit libs
        hardware.graphics = {
          enable = true;
          enable32Bit = true;
        };

        # Sunshine for game streaming
        # TODO: No need to declare uinput group and enable `hardware.uinput`
        # manually after https://github.com/NixOS/nixpkgs/pull/493109 merged.
        hardware.uinput.enable = true;
        services.sunshine = {
          enable = true;
          autoStart = false;
          capSysAdmin = true;
          openFirewall = true;
        };

        hardware.intelgpu.driver = "xe";

        # i2c support for ddcutil for external monitor brightness control
        hardware.i2c.enable = true;

        # This option defines the first version of NixOS you have installed on this particular machine,
        # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
        #
        # Most users should NEVER change this value after the initial install, for any reason,
        # even if you've upgraded your system to a new NixOS release.
        #
        # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
        # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
        # to actually do that.
        #
        # This value being lower than the current NixOS release does NOT mean your system is
        # out of date, out of support, or vulnerable.
        #
        # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
        # and migrated your data accordingly.
        #
        # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
        system.stateVersion = "24.05"; # Did you read the comment?
      })
    ];
  };
}
