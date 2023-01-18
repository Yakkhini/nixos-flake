{pkgs, ...}: {
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
}
