{config, ...}: {
  flake.modules.nixos.desktop-base = {pkgs, ...}: {
    home-manager.sharedModules = [
      config.flake.modules.homeManager.desktop-base
    ];

    imports = [
      config.flake.modules.nixos.display
      config.flake.modules.nixos.vpn
    ];

    #console
    console = {
      earlySetup = true;
      useXkbConfig = true; # use xkbOptions in tty.
    };

    #envar
    environment.pathsToLink = ["/share/zsh"];
    environment.sessionVariables = {
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };

    xdg.portal = {
      enable = true;
      config.niri.default = "gnome";
      extraPortals = [
        pkgs.xdg-desktop-portal-gnome
      ];
    };
    xdg.sounds.enable = true;

    # Podman
    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = true;
      };
    };

    #Blueman
    services.blueman.enable = true;

    # Enable MTP service to serve android file transfer.
    services.gvfs.enable = true;

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Soteria GUI Policy Toolkit
    security.soteria.enable = true;

    # Configure keymap in X11
    services.xserver.xkb.layout = "us";
    # services.xserver.xkbOptions = {
    #   "eurosign:e";
    #   "caps:escape" # map caps to escape.
    # };

    # Enable CUPS to print documents.
    # services.printing.enable = true;

    # Save Power with suto-cpufreq Service
    services.auto-cpufreq.enable = true;

    # Enable sound.
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };
  };

  flake.modules.homeManager.desktop-base = {pkgs, ...}: {
    imports = [
      ../home/i18n.nix

      ../home/programs/alacritty.nix
      ../home/programs/tofi.nix
      ../home/programs/waybar.nix
    ];
    catppuccin.enable = true;
    catppuccin.autoEnable = false;
    catppuccin.flavor = "mocha";
    catppuccin.cursors = {
      accent = "dark";
      enable = true;
    };

    home.sessionVariables = {
      QT_AUTO_SCREEN_SCALE_FACTOR = 1;
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
      QT_QPA_PLATFORMTHEME = "qt5ct";
      SDL_VIDEODRIVER = "wayland";
      SDL_VIDEO_WAYLAND_SCALE_TO_DISPLAY = 0;
      XDG_SESSION_TYPE = "wayland";
      XDG_SCREENSHOTS_DIR = "$HOME/Pictures/ScreenShots";
      BROWSER = "zen";
      OPENROUTER_API_KEY = "`cat ~/Public/openrouter`";
      OPENAI_API_KEY = "`cat ~/Public/openai`";
    };

    home.pointerCursor = {
      enable = true;
      size = 32;
      hyprcursor.enable = true;
    };

    catppuccin.gtk.icon = {
      enable = true;
      accent = "maroon";
    };

    gtk = {
      enable = true;
      font.name = "sans-serif";
      font.size = 14;
      gtk4.theme = null;
    };
  };
}
