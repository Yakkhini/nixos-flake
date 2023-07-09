{
  config,
  lib,
  pkgs,
  ...
}: {
  # pkgs: greetd, tuigreet
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    # StandardInput = "tty";
    # StandardOutput = "tty";
    # StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    # TTYReset = true;
    # TTYVHangup = true;
    # TTYVTDisallocate = true;
  };

  # greetd session manager to fit sway & Wayland.
  services.greetd = {
    enable = true;
    vt = 2;
    settings = rec {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --cmd Hyprland";
        user = "yakkhini";
      };
    };
  };

  services.xserver.displayManager.lightdm.enable = false;
}
