{pkgs, ...}: {
  services.displayManager.sessionPackages = [pkgs.niri];

  # Fix `graphical-session.target` too early issue.
  # Ref: https://github.com/NixOS/nixpkgs/pull/297434#issuecomment-2348783988
  systemd.services.display-manager.environment.XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "dur_file";
      bigclock = "en";
      full_color = true;
      dur_file_path = "/home/yakkhini/Pictures/WallPapers/blackhole-smooth-240x67.dur";
    };
  };

  services.xserver.displayManager.lightdm.enable = false;
}
