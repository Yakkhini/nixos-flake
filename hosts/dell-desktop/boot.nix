{
  config,
  lib,
  pkgs,
  ...
}: {
  # For Mount NTFS disks
  boot.supportedFilesystems = ["ntfs"];
  boot.extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      fontSize = 24;
    };
  };
}
