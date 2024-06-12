{...}: {
  # Additional hyprlock & hy
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = import ./hyprland.conf;
  };

  xdg.configFile."hypr/hyprlock.conf".source = ./hyprlock.conf;
  xdg.configFile."hypr/hypridle.conf".source = ./hypridle.conf;

  programs.wlogout.enable = true;

  services.mako = {
    enable = true;
    catppuccin.enable = true;

    defaultTimeout = 5000;

    height = 300;
    width = 500;

    font = "monospace 12";
    borderRadius = 10;
    borderSize = 2;
    padding = "10";
  };

  xsession.windowManager.i3.enable = true;

  xresources.properties = {
    "Xft.dpi" = 192;
  };
}
