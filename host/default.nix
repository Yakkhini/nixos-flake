{
  config,
  lib,
  pkgs,
  home-manager,
  nur,
  ...
}: {
  nix.settings.substituters = ["https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = ["root" "@wheel"];
  # Systemwide nixpkgs config
  nixpkgs.config = {
    allowUnfree = true;
  };

  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ../system
    ../home
  ];

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
}
