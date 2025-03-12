{
  config,
  lib,
  nixpkgs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./mount.nix
    ../../system
    ../../home
  ];

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

  nix.settings.substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://mirror.sjtu.edu.cn/nix-channels/store"
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = ["root" "@wheel"];
  nix.registry.pkgs.flake = nixpkgs;
  # Systemwide nixpkgs config
  nixpkgs.config = {
    allowUnfree = true;
  };

  services.thermald.enable = lib.mkDefault true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Steam need 32bit libs
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.intelgpu.driver = "xe";

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
}
