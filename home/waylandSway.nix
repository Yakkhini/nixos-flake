{pkgs, ...}: {
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      startup = [
        {command = "fcitx5";}
        {
          command = ''
            swayidle -w \
              timeout 300 'swaylock -f -c 000000' \
              timeout 600 'swaymsg " output * dpms off "' resume 'swaymsg " output * dpms on "' \
              before-sleep 'swaylock -f -c 000000'
          '';
        }
      ];
      seat = {
        "*".xcursor_theme = "Hackneyed 36";
      };
      terminal = "alacritty";
      output = {
        "*".bg = "/home/vortexlove/Pictures/Wallpaper/Blade_Runner_car.jpg tile";
        eDP-1.pos = "1920 0";
        DP-1.pos = "0 0";
      };
      gaps = {
        outer = 0;
        inner = 8;
        smartBorders = "on";
        smartGaps = true;
      };
      floating.criteria = [
        {app_id = "pinentry-qt";}
        {app_id = "org.gnome.Nautilus";}
      ];
      bars = [{command = "waybar";}];
    };
  };
}
