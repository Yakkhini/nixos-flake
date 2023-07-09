{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      # Background opacity
      #
      # Window opacity as a floating point number from `0.0` to `1.0`.
      # The value `0.0` is completely transparent and `1.0` is opaque.
      window.opacity = 0.8;

      # Font configuration
      font = {
        normal.family = "Hack Nerd Font";
        size = 14.0;
      };

      # Colors (Desert)
      /*
      colors = {
        primary = {
          background = "0x191724";
          foreground = "0xe0def4";
        };
        cursor = {
          text = "0xe0def4";
          cursor = "0x524f67";
        };
        vi_mode_cursor = {
          text = "0xe0def4";
          cursor = "0x524f67";
        };
        line_indicator = {
          foreground = "None";
          background = "None";
        };
        selection = {
          text = "0xe0def4";
          background = "0x403d52";
        };
        normal = {
          black = "0x26233a";
          red = "0xeb6f92";
          green = "0x31748f";
          yellow = "0xf6c177";
          blue = "0x9ccfd8";
          magenta = "0xc4a7e7";
          cyan = "0xebbcba";
          white = "0xe0def4";
        };
        bright = {
          black = "0x6e6a86";
          red = "0xeb6f92";
          green = "0x31748f";
          yellow = "0xf6c177";
          blue = "0x9ccfd8";
          magenta = "0xc4a7e7";
          cyan = "0xebbcba";
          white = "0xe0def4";
        };
        hints = {
          start = {
            foreground = "#908caa";
            background = "#1f1d2e";
          };
          end = {
            foreground = "#6e6a86";
            background = "#1f1d2e";
          };
        };
      };
      */

      colors = {
        primary = {
          background = "0xfaf4ed";
          foreground = "0x575279";
        };
        cursor = {
          text = "0x575279";
          cursor = "0xcecacd";
        };
        vi_mode_cursor = {
          text = "0x575279";
          cursor = "0xcecacd";
        };
        line_indicator = {
          foreground = "None";
          background = "None";
        };
        selection = {
          text = "0x575279";
          background = "0xdfdad9";
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
