{
  config,
  lib,
  pkgs,
  ...
}: {
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
