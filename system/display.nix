{
  config,
  lib,
  pkgs,
  ...
}: {
  # pkgs: greetd, tuigreet
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
  };

  # greetd session manager to fit sway & Wayland.
  services.greetd = {
    enable = true;
    vt = 2;
    settings = rec {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --cmd sway";
        user = "yakkhini";
      };
    };
  };

  services.xserver.displayManager.lightdm.enable = false;
}
