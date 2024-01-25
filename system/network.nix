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
    networkmanager = {
      enable = true; # Easiest to use and most distros use this by default.
      firewallBackend = "nftables";
    };
  };

  # Clash deamon service
  systemd.services.clash-daemon = {
    enable = true;
    description = "Clash daemon, A rule-based proxy in Go.";
    after = ["network.target"];
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      ExecStart = "${pkgs.clash-meta}/bin/clash-meta -d /home/yakkhini/.config/clash";
    };
    wantedBy = ["multi-user.target"];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
}
