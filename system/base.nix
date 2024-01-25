{
  config,
  lib,
  pkgs,
  ...
}: {
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Documentation.
  documentation.enable = true;
  documentation.dev.enable = true;

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

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
  xdg.sounds.enable = true;

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

  # Systemd tmpfiles.d
  systemd.tmpfiles.rules = ["w /sys/power/image_size - - - - 0"];

  # Waydroid support
  virtualisation = {
    # docker = {
    #   enable = true;
    #   rootless.enable = true;
    # };
    # waydroid.enable = true;
    # lxd.enable = true;
  };

  # ADB
  programs.adb.enable = true;

  #Blueman
  services.blueman.enable = true;

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

  # Save Power with tlp Service
  services.tlp.enable = true;

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

  # Pam
  security.pam.services.swaylock = {}; # swaylock
}
