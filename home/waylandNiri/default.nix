{pkgs, ...}: {
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
  };

  # Ref: https://wiki.nixos.org/wiki/Swayidle
  services.swayidle = let
    # Lock command
    # lock = "if pidof quickshell; then noctalia-shell ipc call lockScreen lock; else pidof hyprlock || ${pkgs.niri}/bin/niri msg action spawn -- hyprlock; fi";
    lock = "if ${pkgs.procps}/bin/pidof quickshell; then ${pkgs.niri}/bin/niri msg action spawn -- noctalia-shell ipc call lockScreen lock; else pidof hyprlock || ${pkgs.niri}/bin/niri msg action spawn -- hyprlock; fi";
    # TODO: modify "display" function based on your window manager
    # Sway
    # display = status: "${pkgs.sway}/bin/swaymsg 'output * power ${status}'";
    # Hyprland
    # display = status: "hyprctl dispatch dpms ${status}";
    # Niri
    display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
  in {
    enable = true;
    timeouts = [
      {
        timeout = 595; # in seconds
        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
      }
      {
        timeout = 600;
        command = lock;
      }
      {
        timeout = 1200;
        command = display "off";
        resumeCommand = display "on";
      }
      {
        timeout = 1500;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = {
      # adding duplicated entries for the same event may not work
      before-sleep = (display "off") + "; " + lock;
      after-resume = display "on";
      lock = (display "off") + "; " + lock;
      unlock = display "on";
    };
  };

  programs.wlogout.enable = true;

  xsession.windowManager.i3.enable = true;

  xresources.properties = {
    "Xft.dpi" = 192;
  };
}
