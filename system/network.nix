{...}: {
  networking = {
    nftables = {
      enable = true;
    };
    networkmanager = {
      enable = true; # Easiest to use and most distros use this by default.
      ethernet.macAddress = "stable";
      wifi.macAddress = "stable-ssid";
    };
  };

  services.openssh = {
    enable = true;
    ports = [22112];
    settings = {
      PermitRootLogin = "no";
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;
}
