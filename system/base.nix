{
  config,
  lib,
  pkgs,
  ...
}: {
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  #console
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

  #envar
  environment.pathsToLink = ["/share/zsh"];
  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  # Enable MTP service to serve android file transfer.
  services.gvfs.enable = true;

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

  # Pam
  security.pam.services.swaylock = {}; # swaylock
}
