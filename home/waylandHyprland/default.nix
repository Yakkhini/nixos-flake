{...}: {
  # Additional hyprlock & hy
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = import ./hyprland.conf;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = ["/home/yakkhini/Pictures/WallPapers/for-night-mode-lovers.webp"];

      wallpaper = ", /home/yakkhini/Pictures/WallPapers/for-night-mode-lovers.webp";
    };
  };

  xdg.configFile."hypr/hyprlock.conf".source = ./hyprlock.conf;
  xdg.configFile."hypr/hypridle.conf".source = ./hypridle.conf;

  programs.wlogout.enable = true;

  catppuccin.mako.enable = true;
  services.mako = {
    enable = true;

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
