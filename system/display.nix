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
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --remember --time --cmd niri-session";
        user = "yakkhini";
      };
    };
  };

  services.xserver.displayManager.lightdm.enable = false;
}
