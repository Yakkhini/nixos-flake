{pkgs, ...}: {
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Documentation.
  documentation.enable = true;
  documentation.dev.enable = true;

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
}
