{
  config,
  lib,
  pkgs,
  home-manager,
  ...
}: {
  home-manager.users.yakkhini = {pkgs, ...}: {
    home.stateVersion = "22.11";
    imports = [
      ./programs
      ./nixpkgs.nix
      ./packages.nix
      ./services.nix
      ./waylandSway.nix
    ];
    /*
    nixpkgs.config = {
      allowUnfree = true;
      packageOverrides = pkgs: rec {
        hackneyed = pkgs.hackneyed.overrideAttrs (finalAttrs: previousAttrs: {
          buildFlags = [
            "-j20"
            "-B"
            "THEME_NAME=Hackneyed-Dark"
            "COMMON_SOURCE=theme/common-dark.svg"
            "RSVG_SOURCE=theme/right-handed-dark.svg"
            "LSVG_SOURCE=theme/left-handed-dark.svg"
            "theme"
            "theme.left"
          ];
        });
        papirus-icon-theme = pkgs.papirus-icon-theme.override {
          color = "adwaita";
        };
      };
    };
    home.packages = [
      pkgs.gnome.nautilus
      pkgs.tilix
      pkgs.firefox
      pkgs.brave
      pkgs.gopass
      pkgs.hyprland
      pkgs.grim
      pkgs.texlive.combined.scheme-full
      pkgs.nomacs
      pkgs.okular
      pkgs.wl-clipboard
      pkgs.wlsunset
      pkgs.swayidle
      pkgs.swaylock # additional config: security.pam.services.swaylock
      pkgs.pipes-rs
      pkgs.vscode-fhs
      pkgs.sway-contrib.grimshot
      pkgs.wlogout
      pkgs.pavucontrol
      pkgs.viu
      pkgs.vanilla-dmz
      pkgs.hackneyed
      pkgs.orchis-theme
      pkgs.papirus-folders
      pkgs.papirus-icon-theme
    ];
    */
    home.sessionVariables = {
      XDG_SCREENSHOTS_DIR = "$HOME/Pictures/ScreenShots";
      BROWSER = "brave";
      EDITOR = "vim";
      GTK_THEME = "Orchis-Red-Dark-Compact";
      GDK_BACKEND = "x11";
    };
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };

    gtk = {
      enable = true;
      theme.name = "Orchis-Red-Dark-Compact";
      iconTheme.name = "Papirus-Dark";
      cursorTheme.name = "Hackneyed";
      cursorTheme.size = 36;
      font.name = "PT Sans Caption";
      font.size = 14;
    };
    /*
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
      };
    };
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "bottom";
          position = "bottom";
          modules-left = [
            "sway/workspaces"
            "sway/mode"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "network"
            "backlight"
            "pulseaudio"
            "battery"
            "idle_inhibitor"
            "tray"
            "custom/grimshot"
            "custom/power"
          ];
          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = false;
            format = "{icon}";
            format-icons = {
              "1" = "一";
              "2" = "二";
              "3" = "三";
              "4" = "四";
              "5" = "五";
              "6" = "六";
              "7" = "七";
              "8" = "八";
              "9" = "九";
              "10" = "十";
              urgent = "";
              focused = "";
              default = "";
            };
          };
          "sway/mode" = {
            format = "<span style=\"italic\">{}</span>";
          };
          "sway/language" = {
            format = "{long} ";
          };
          clock = {
            format = "{:%R %a %d/%m/%Y}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
          cpu = {
            format = "{usage}% @ {max_frequency}GHz ";
          };
          temperature = {
            thermal-zone = 2;
            hwmon-path = "/sys/class/hwmon/hwmon0/temp2_input";
            critical-threshold = 80;
            format-critical = "{temperatureC}°C {icon}";
            format = "{temperatureC}°C {icon}";
            format-icons = [
              ""
            ];
          };
          memory = {
            format = "{used:0.2f}/{total:0.2f} ";
          };
          backlight = {
            # device = "acpi_video1";
            format = "{percent}% {icon}";
            format-icons = ["" ""];
          };
          disk = {
            states = {
              good = 0;
              warning = 70;
              critical = 95;
            };
            interval = 5;
            format = "{percentage_used}% {free} ";
            path = "/";
          };
          network = {
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ifname} ";
            format-alt = "{ifname}: {ipaddr}/{cidr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "Disconnected ";
          };
          pulseaudio = {
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-muted = "婢 {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
              headphones = "";
              speaker = "蓼";
              hdmi = "﴿";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              hifi = "";
              default = ["" "" ""];
            };
            scroll-step = 1;
            on-click = "pavucontrol";
          };
          idle_inhibitor = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
          };
          battery = {
            format = "{icon}";
            format-icons = ["" "" "" "" ""];
            states = {
              good = 75;
              medium = 50;
              warning = 30;
              critical = 15;
            };
            # format = "{capacity}% {icon}";
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-plugged-full = "";
            format-alt = "{time} {icon}";
          };
          tray = {
            _icon-size = 21;
            spacing = 10;
          };
          "custom/power" = {
            format = "YAKKHINI";
            tooltip = false;
            on-click = "wlogout";
          };
          "custom/grimshot" = {
            format = "";
            on-click = "grimshot save output $HOME/Pictures/ScreenShots/$USER@$HOST_`date +%Y%m%d%H%M%S.png`";
            on-click-middle = "grimshot save window $HOME/Pictures/ScreenShots/$USER@$HOST_`date +%Y%m%d%H%M%S.png`";
            on-click-right = "grimshot save area $HOME/Pictures/ScreenShots/$USER@$HOST_`date +%Y%m%d%H%M%S.png`";
            tooltip = false;
          };
        };
      };
      style = ''
        * {
            font-family:  'PT Sans Narrow', 'DroidSansMono Nerd Font Mono', sans-serif;
            font-size: 18px;
            font-weight: bold;
        }

        window#waybar {
            background: #251A1B;
            transition-property: background-color;
            transition-duration: .5s;
        }

        #workspaces,
        #language,
        #clock,
        #battery,
        #cpu,
        #memory,
        #temperature,
        #backlight,
        #network,
        #backlight,
        #battery,
        #pulseaudio,
        #custom-media,
        #tray,
        #disk,
        #mode,
        #idle_inhibitor,
        #custom-power,
        #custom-grimshot
        {
            color: #E5BB9E;
            background: #AB1716;
            margin: 4px 0px;
            padding: 2px 10px;
            border: 0px solid rgba(0, 0, 0, 0);
            border-radius: 0px;
            background-clip: padding-box;
        }

        #clock, #network, #backlight, #tray, #idle_inhibitor, #custom-power {
            border-top-left-radius: 90px;
            border-bottom-left-radius: 90px;
            margin-left: 4px;
        }

        #clock, #battery, #network, #custom-grimshot, #idle_inhibitor, #custom-power {
            border-top-right-radius: 90px;
            border-bottom-right-radius: 90px;
            margin-right: 4px;
        }

        #custom-power {
            margin-right: 0px;

        }

        #workspaces {
            margin-left: 0px;
            padding: 0px 0px;
            border-radius: 90px;
            margin: 4px 0px;
        }

        #workspaces button {
            padding: 0px 8px;
            margin: 0px 0px;
            color: #CEA9A6;
            border-radius: 90px;
        }

        #workspaces button.focused {
            color: #251A1B;
            background-color: #E5BB9E;
            border-radius: 90px;
        }

        #workspaces button:hover {
            box-shadow: inherit;
            text-shadow: inherit;
            border-radius: 90px;
        }

        #network.disconnected,
        #temperature.critical,
        #pulseaudio.muted,
        #idle_inhibitor.activated {
            color: #251A1B;
            background-color: #CEA9A6;
        }
      '';
    };
    programs.swaylock.settings = {
      image = "/home/vortexlove/Pictures/Wallpaper/Blade_runner_1.jpg";
    };
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      historySubstringSearch = {
        enable = true;
        searchUpKey = "^[OA";
        searchDownKey = "^[OB";
      };
      prezto = {
        enable = true;
        prompt.theme = "pure";
      };
    };
    programs.git = {
      enable = true;
      signing.key = "F27FB4A20C9CCAC0";
      signing.signByDefault = true;
      userEmail = "59007159+Yakkhini@users.noreply.github.com";
      userName = "Yaksis";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    programs.emacs.enable = true;
    programs.vim = {
      enable = true;
      defaultEditor = true;
      settings.undodir = ["$HOME/.vim/undo"];
      extraConfig = ''
        syntax on
        filetype on
        set number
        set relativenumber
        set cursorline
        set wrap
        set showcmd
        set wildmenu
        set undofile
        set nofoldenable

        set hlsearch
        set incsearch
        set ignorecase
        set smartcase
        set scrolloff=5
        set textwidth=80

        cmap w!! w !sudo tee %

        " wayland clipboard support
        xnoremap "+y y:call system("wl-copy", @")<cr>
        nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', ''', 'g')<cr>p
        nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', ''', 'g')<cr>p
      '';
    };
    programs.git = {
      delta.enable = true;
    };
    programs.gitui.enable = true;
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
        bars = [{command = "waybar";}];
      };
    };
    services = {
      swayidle.enable = true;
      dunst.enable = true;
    };
    */
  };
}
