{
  pkgs,
  hyprland,
  ...
}: {
  # imports = [
  #   ./eww.nix
  # ];
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = import ./hyprland.conf;
  };
}
