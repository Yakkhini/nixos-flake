{...}: {
  # Additional hyprlock & hy
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = import ./hyprland.conf;
  };

  services.swww.enable = true;

  xdg.configFile."hypr/hyprlock.conf".source = ./hyprlock.conf;
  xdg.configFile."hypr/hypridle.conf".source = ./hypridle.conf;

  programs.wlogout.enable = true;

  catppuccin.mako.enable = true;
  services.mako = {
    enable = true;

    settings = {
      actions = true;
      anchor = "bottom-center";
      default-timeout = 5000;

      height = 300;
      width = 500;

      font = "monospace 12";
      border-radius = 10;
      border-size = 2;
      padding = "10";

      "actionable=true" = {
        anchor = "bottom-right";
      };
    };
  };

  xsession.windowManager.i3.enable = true;

  xresources.properties = {
    "Xft.dpi" = 192;
  };
}
