{
  config,
  lib,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nixd
    man-pages
    man-pages-posix
    cifs-utils
    clash-meta
    greetd.wlgreet
    greetd.tuigreet
    neofetch
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    ranger
    ncdu
    light
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-qt;
    };
    git.enable = true;
    zsh.enable = true;
    dconf.enable = true;
    light.enable = true;
  };
}
