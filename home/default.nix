{
  config,
  lib,
  pkgs,
  home-manager,
  nur,
  nix-doom-emacs,
  hyprland,
  ...
}: {
  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = true;

  home-manager.users.yakkhini = {pkgs, ...}: {
    home.stateVersion = "22.11";
    imports = [
      nix-doom-emacs.hmModule
      hyprland.homeManagerModules.default
      nur.nixosModules.nur
      ./programs
      ./email.nix
      ./nixpkgs.nix
      ./packages.nix
      ./services.nix
      ./waylandSway.nix
      ./waylandHyprland
    ];

    home.sessionVariables = {
      XDG_SCREENSHOTS_DIR = "$HOME/Pictures/ScreenShots";
      BROWSER = "brave";
      EDITOR = "vim";
      GTK_THEME = "Orchis-Red-Dark-Compact";
      XCURSOR_SIZE = "32";
      XCURSOR_NAME = "Bibata-Original-Classic";
    };

    home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = 32;
      x11.defaultCursor = "Bibata-Original-Classic";
      gtk.enable = true;
      x11.enable = true;
    };

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };

    gtk = {
      enable = true;
      theme.name = "Orchis-Red-Dark-Compact";
      iconTheme.name = "Papirus-Dark";
      cursorTheme.name = "Bibata-Original-Classic";
      cursorTheme.size = 32;
      font.name = "PT Sans Caption";
      font.size = 14;
    };
  };
}
