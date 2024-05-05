{pkgs, ...}: {
  # Additional hyprlock & hy
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = import ./hyprland.conf;
  };

  xdg.configFile."hypr/hyprlock.conf".source = ./hyprlock.conf;
  xdg.configFile."hypr/hypridle.conf".source = ./hypridle.conf;

  xsession.windowManager.i3.enable = true;

  xresources.properties = {
    "Xft.dpi" = 192;
  };
}
