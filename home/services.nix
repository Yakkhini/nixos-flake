{pkgs, ...}: {
  services = {
    swayidle.enable = true;

    syncthing = {
      enable = true;
    };
  };
}
