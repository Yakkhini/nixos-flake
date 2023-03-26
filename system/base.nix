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
    font = "LatArCyrHeb-19";
    #   keyMap = "us";
    colors = [
      "393552" # Black
      "EB6F92" # Red
      "9CCFD8" # Green
      "F6C177" # Yellow
      "3E8FB0" # Blue
      "C4A7E7" # Magenta
      "EA9A97" # Cyan
      "E0DEF4" # Light gray

      "6E6A86" # Dark gray
      "EB6F92" # Light Red
      "9CCFD8" # Light Green
      "F6C177" # Light Yellow
      "3E8FB0" # Light Blue
      "C4A7E7" # Light Magenta
      "EA9A97" # Light Cyan
      "E0DEF4" # White
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

  # Mount Disks
  fileSystems."/mnt/diskc" = {
    device = "/dev/nvme0n1p3";
    noCheck = true;
    options = ["rw" "noatime"];
  };
  fileSystems."/mnt/diskd" = {
    device = "/dev/sda2";
    noCheck = true;
    options = ["uid=yakkhini" "gid=users" "rw" "noatime"];
  };
  fileSystems."/mnt/diske" = {
    device = "/dev/sda3";
    noCheck = true;
    options = ["uid=yakkhini" "gid=users" "rw" "noatime"];
  };
  
  # ADB
  programs.adb.enable = true;

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
