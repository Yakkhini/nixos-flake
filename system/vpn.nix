{...}: {
  programs.clash-verge = {
    enable = true;
    autoStart = true;
    serviceMode = true;
    tunMode = true;
  };

  # Tailscale for virtual network
  # Ref1: https://wiki.nixos.org/wiki/Tailscale
  # Ref2: https://tailscale.com/docs/concepts/userspace-networking
  #
  # Also search tailscale clash verge on web for more information.
  services.tailscale = {
    enable = true;

    # Use userspace networking as a socks5 proxy
    # to avoid conflicts with clash TUN mode.
    interfaceName = "userspace-networking";
    extraDaemonFlags = ["--socks5-server=localhost:1055"];
  };

  # Force tailscaled to use nftables (Critical for clean nftables-only systems)
  # This avoids the "iptables-compat" translation layer issues.
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];
}
