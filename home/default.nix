{
  config,
  lib,
  pkgs,
  home-manager,
  nix-doom-emacs,
  ...
}: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.yakkhini = {pkgs, ...}: {
    home.stateVersion = "22.11";
    imports = [
      nix-doom-emacs.hmModule
      ./programs
      ./email.nix
      ./nixpkgs.nix
      ./packages.nix
      ./services.nix
      ./waylandSway.nix
    ];

    home.sessionVariables = {
      XDG_SCREENSHOTS_DIR = "$HOME/Pictures/ScreenShots";
      BROWSER = "brave";
      EDITOR = "vim";
      GTK_THEME = "Orchis-Red-Dark-Compact";
    };
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };

    gtk = {
      enable = true;
      theme.name = "Orchis-Red-Dark-Compact";
      iconTheme.name = "Papirus-Dark";
      cursorTheme.name = "Hackneyed";
      cursorTheme.size = 36;
      font.name = "PT Sans Caption";
      font.size = 14;
    };
  };
}
