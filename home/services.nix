{pkgs, ...}: {
  services = {
    swayidle.enable = true;
    dunst.enable = true;

    syncthing = {
      enable = true;
    };
  };
}
