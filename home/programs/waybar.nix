{
  pkgs,
  catppuccin,
  ...
}: {
  catppuccin.waybar.enable = true;
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "tray"
          "network"
          "cpu"
          "memory"
          "temperature"
          "backlight"
          "battery"
          "clock"
        ];
        "niri/workspaces" = {
          on-click = "activate";
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
        "niri/window" = {
          separate-outputs = true;
        };
        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };
        "sway/language" = {
          format = "{long} ";
        };
        clock = {
          # "timezone": "America/New_York",
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
          format = "{usage}% ";
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
          format = "{}% ";
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
          format = "{percentage_used}% {free} 󰋊";
          path = "/";
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "Ethernet: {ifname} 󰈀";
          format-alt = "{ifname}: {ipaddr}/{cidr} 󰖟";
          format-linked = "{ifname} (No IP) 󰖟";
          format-disconnected = "Disconnected 󰕑";
        };
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphones = "󰋋";
            speaker = "󰓃";
            hdmi = "󰽟";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            hifi = "󰐵";
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
          format-icons = ["" "" "" "" ""];
          states = {
            good = 75;
            medium = 50;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-plugged-full = "";
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
        "custom/grimblast" = {
          format = "󰹑";
          on-click = "grimblast --notify save area $HOME/Pictures/ScreenShots/$USER@$HOST_`date +%Y%m%d%H%M%S.png`";
          on-click-right = "grimblast --notify save output $HOME/Pictures/ScreenShots/$USER@$HOST_`date +%Y%m%d%H%M%S.png`";
          tooltip = false;
        };
      };
    };

    style = ''
            * {
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: sans-serif, MonaspiceNe NFP Light;
          font-size: 16px;
      }

      window#waybar {
          background-color: rgba(43, 48, 59, 0.5);
          border-bottom: 3px solid rgba(100, 114, 125, 0.5);
          color: #ffffff;
          transition-property: background-color;
          transition-duration: .5s;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      /*
      window#waybar.empty {
          background-color: transparent;
      }
      window#waybar.solo {
          background-color: #FFFFFF;
      }
      */

      window#waybar.termite {
          background-color: #3F3F3F;
      }

      window#waybar.chromium {
          background-color: #000000;
          border: none;
      }

      button {
          /* Use box-shadow instead of border so the text isn't offset */
          box-shadow: inset 0 -3px transparent;
          /* Avoid rounded borders under each button name */
          border: none;
          border-radius: 0;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
          background: inherit;
          box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button {
          padding: 0 5px;
          background-color: transparent;
          color: #ffffff;
      }

      #workspaces button:hover {
          background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.active {
          background-color: #64727D;
          box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button.urgent {
          background-color: #eb4d4b;
      }

      #mode {
          background-color: #64727D;
          border-bottom: 3px solid #ffffff;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #custom-grimblast
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
          padding: 0 10px;
          background-color: @surface0;
          color: @text;
      }

      #window,
      #workspaces {
          margin: 0 4px;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #clock {
        color: @rosewater;
      }

      #battery {
      }

      #battery.charging, #battery.plugged {
          color: @green;
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
      }

      #battery.critical:not(.charging) {
          background-color: @red;
          color: @text;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      label:focus {
        background-color: #000000;
      }

      #cpu {
        color: @blue;
      }

      #memory {
        color: @blue;
      }

      #disk {
        color: @blue;
      }

      #backlight {
        color: @teal;
      }

      #network {
        color: @mauve;
      }

      #network.disconnected {
      }

      #pulseaudio {
        color: @pink;
      }

      #pulseaudio.muted {
          background-color: @teal;
          color: @subtext0;
      }

      #wireplumber {
      }

      #wireplumber.muted {
          background-color: #f53c3c;
      }

      #custom-media {
          background-color: #66cc99;
          color: #2a5c45;
          min-width: 100px;
      }

      #custom-media.custom-spotify {
          background-color: #66cc99;
      }

      #custom-media.custom-vlc {
          background-color: #ffa000;
      }

      #temperature {
        color: @maroon;
      }

      #temperature.critical {
          background-color: #eb4d4b;
      }

      #custom-grimblast {
        margin: 0px 0px;
        padding: 0px 10px;
        background-color: @surface0;
        color: @text;
      }
      #tray {
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
      }

      #idle_inhibitor {
        color: @teal;
      }

      #idle_inhibitor.activated {
        background-color: @rosewater;
        color: @overlay1;
      }

      #mpd {
          background-color: #66cc99;
          color: #2a5c45;
      }

      #mpd.disconnected {
          background-color: #f53c3c;
      }

      #mpd.stopped {
          background-color: #90b1b1;
      }

      #mpd.paused {
          background-color: #51a37a;
      }

      #language {
          background: #00b093;
          color: #740864;
          padding: 0 5px;
          margin: 0 5px;
          min-width: 16px;
      }

      #keyboard-state {
          background: #97e1ad;
          color: #000000;
          padding: 0 0px;
          margin: 0 5px;
          min-width: 16px;
      }

      #keyboard-state > label {
          padding: 0 5px;
      }

      #keyboard-state > label.locked {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad.empty {
      	background-color: transparent;
      }
    '';
  };
}
