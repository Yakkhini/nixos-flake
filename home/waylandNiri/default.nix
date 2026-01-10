{pkgs, ...}: {
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;

  services.swww.enable = true;
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

  programs.wlogout.enable = true;

  xsession.windowManager.i3.enable = true;

  xresources.properties = {
    "Xft.dpi" = 192;
  };
}
