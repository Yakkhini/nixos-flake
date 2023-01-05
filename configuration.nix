# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, home-manager, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      home-manager.nixosModule
    ];

  nix.settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the GRUB boot loader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      fontSize = 24;
    };
  };

  # Home Manager
  home-manager.users.yakkhini = { pkgs, ... }: {
    home.stateVersion = "22.11";
    nixpkgs.config = {
      allowUnfree = true;
      packageOverrides = pkgs: rec {
        hackneyed = pkgs.hackneyed.overrideAttrs (finalAttrs: previousAttrs:
          {
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
    home.sessionVariables = {
      XDG_SCREENSHOTS_DIR = "$HOME/Pictures/ScreenShots";
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
            format-icons = [ "" "" ];
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
              default = [ "" "" "" ];
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
            format-icons = [ "" "" "" "" "" ];
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
      style =
        ''
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
      settings.undodir = [ "$HOME/.vim/undo" ];
      extraConfig =
        ''
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
          { command = "fcitx5"; }
          {
            command =
              ''
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
        bars = [{ command = "waybar"; }];
      };
    };
    services = {
      swayidle.enable = true;
      dunst.enable = true;
    };
  };

  # Systemwide nixpkgs config
  nixpkgs.config = {
    allowUnfree = true;
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
  };

  # greetd session manager to fit sway & Wayland.
  services.greetd = {
    enable = true;
    vt = 2;
    settings = rec {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --cmd sway";
        user = "yakkhini";
      };
    };
  };

  services.xserver.displayManager.lightdm.enable = false;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking = {
    nftables = {
      enable = true;
      ruleset =
        ''
          table ip nat {
            chain output {
              type nat hook output priority filter; policy accept;
              ip daddr 127.0.0.1/8 counter return
              ip daddr 224.0.0.0/4 counter return
              ip daddr 192.168.0.0/16 counter return
              ip daddr 255.255.255.255/32 counter return
              ip daddr 10.0.0.0/8 counter return
              meta mark 7899 counter return
              udp dport 1053 counter return
              ip protocol tcp counter redirect to :7892
              udp dport 53 counter redirect to :1053
            }
            chain prerouting {
              type nat hook prerouting priority dstnat; policy accept;

              ip protocol tcp counter redirect to :7892
              udp dport 53 counter redirect to :1053
              tcp dport 7892 counter
              tcp dport 53 counter
              meta mark 123 counter
            }
            chain debug {
              type filter hook prerouting priority filter; policy accept;
              ip protocol tcp counter
              tcp dport 7892 counter
              udp dport 1053 counter
              udp dport 53 counter
            }
          }

          table ip mangle {
              chain output {
                type route hook output priority mangle; policy accept;
                ip daddr 127.0.0.1/8 counter return
                ip daddr 224.0.0.0/4 counter return
                ip daddr 192.168.0.0/16 counter return
                ip daddr 255.255.255.255/32 counter return
                ip daddr 10.0.0.0/8 counter return
                udp dport 53 counter return
                # ip protocol udp counter mark set 1
            }
              chain prerouting {
                type filter hook prerouting priority mangle; policy accept;
                ip daddr 127.0.0.1/8 counter return
                ip daddr 224.0.0.0/4 counter return
                ip daddr 192.168.0.0/16 counter return
                ip daddr 255.255.255.255/32 counter return
                ip daddr 10.0.0.0/8 counter return
                # ip protocol udp tproxy to 127.0.0.1:7892
            }
          }
        '';
    };
    networkmanager = {
      enable = true; # Easiest to use and most distros use this by default.
      firewallBackend = "nftables";
    };
  };

  # Clash deamon service
  systemd.services.clash-daemon = {
    enable = true;
    description = "Clash daemon, A rule-based proxy in Go.";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      ExecStart = "${pkgs.clash}/bin/clash -d /home/yakkhini/.config/clash";
    };
    wantedBy = [ "multi-user.target" ];
  };

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = { LANGUAGE = "en_US.UTF-8"; };
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8" ];
  console = {
    earlySetup = true;
    font = "Lat2-Terminus16";
    #   keyMap = "us";
    colors = [
      "F2E9E1" # Black
      "B4637A" # Red
      "56949F" # Green
      "EA9D34" # Yellow
      "286983" # Blue
      "907AA9" # Magenta
      "D7827E" # Cyan
      "575279" # Light gray

      "9893A5" # Dark gray
      "B4637A" # Light Red
      "56949F" # Light Green
      "EA9D34" # Light Yellow
      "286983" # Light Blue
      "907AA9" # Light Magenta
      "D7827E" # Light Cyan
      "575279" # White
    ];
    useXkbConfig = true; # use xkbOptions in tty.
  };
  # fonts
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "Hack" "DroidSansMono" ]; })
    openmoji-color
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    source-han-sans
    source-han-serif
    paratype-pt-sans
    paratype-pt-serif
    paratype-pt-mono
    fira-code
    fira-code-symbols
    dina-font
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Openmoji" ];
      monospace = [ "Hack Nerd Font Mono" "Noto Sans Mono CJK SC" ];
      sansSerif = [ "PT Sans" "Noto Sans Mono CJK SC" ];
      serif = [ "PT Serif" "Noto Serif Mono CJK SC" ];
    };
  };

  #envar
  environment.pathsToLink = [ "/share/zsh" ];
  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
  # Input method
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx.engines = with pkgs.fcitx-engines; [ rime ];
    fcitx5.enableRimeData = true;
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-chinese-addons
      fcitx5-gtk
    ];
  };


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Wayland support
  # programs.sway.enable = true;



  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.root.initialHashedPassword = "";
  users.users.yakkhini = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    clash
    greetd.wlgreet
    greetd.tuigreet
    neofetch
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    ranger
    ncdu
    light
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "qt";
    };
    git.enable = true;
    zsh.enable = true;
    dconf.enable = true;
    vim.defaultEditor = true;
    light.enable = true;
  };
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Pam
  security.pam.services.swaylock = { };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

