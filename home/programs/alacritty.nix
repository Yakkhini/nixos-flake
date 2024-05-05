{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      # Background opacity
      #
      # Window opacity as a floating point number from `0.0` to `1.0`.
      # The value `0.0` is completely transparent and `1.0` is opaque.
      window.opacity = 0.9;

      # Font configuration
      font = {
        normal.family = "Hack Nerd Font";
        size = 14.0;
      };

      colors = {
        primary = {
          background = "0xfaf4ed";
          foreground = "0x575279";
          dim_foreground = "0x797593";
          bright_foreground = "0x575279";
        };
        cursor = {
          text = "0x575279";
          cursor = "0xcecacd";
        };
        vi_mode_cursor = {
          text = "0x575279";
          cursor = "0xcecacd";
        };
        search = {
          matches = {
            foreground = "#797593";
            background = "#f2e9e1";
          };
          focused_match = {
            foreground = "#faf4ed";
            background = "#d7827e";
          };
        };
        line_indicator = {
          foreground = "None";
          background = "None";
        };
        selection = {
          text = "0xfffaf3";
          background = "0x9893a5";
        };
        normal = {
          black = "0xf2e9e1";
          red = "0xb4637a";
          green = "0x286983";
          yellow = "0xea9d34";
          blue = "0x56949f";
          magenta = "0x907aa9";
          cyan = "0xd7827e";
          white = "0x575279";
        };
        bright = {
          black = "0x9893a5";
          red = "0xb4637a";
          green = "0x286983";
          yellow = "0xea9d34";
          blue = "0x56949f";
          magenta = "0x907aa9";
          cyan = "0xd7827e";
          white = "0x575279";
        };
        dim = {
          black = "0x9893a5";
          red = "0xb4637a";
          green = "0x286983";
          yellow = "0xea9d34";
          blue = "0x56949f";
          magenta = "0x907aa9";
          cyan = "0xd7827e";
          white = "0x575279";
        };
        hints = {
          start = {
            foreground = "#797593";
            background = "#fffaf3";
          };
          end = {
            foreground = "#9893a5";
            background = "#fffaf3";
          };
        };
      };
    };
  };
}
