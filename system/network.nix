{
  config,
  lib,
  pkgs,
  ...
}: {
  networking = {
    nftables = {
      enable = true;
    };
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
}
