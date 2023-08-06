{
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = import ./hyprland.conf;
  };
}
