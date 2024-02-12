{
  config,
  lib,
  pkgs,
  ...
}: {
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
}
