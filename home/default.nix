{
  config,
  lib,
  pkgs,
  home-manager,
  nur,
  nix-doom-emacs,
  hyprland,
  specialArgs,
  ...
}: {
  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = true;

  home-manager.extraSpecialArgs = specialArgs;

  home-manager.users.yakkhini = {pkgs, ...}: {
    home.stateVersion = "22.11";
    imports = [
      nix-doom-emacs.hmModule
      hyprland.homeManagerModules.default
      nur.nixosModules.nur
      ./programs
      ./nixpkgs.nix
      ./packages.nix
      ./services.nix
      ./waylandSway.nix
      ./waylandHyprland
    ];

    home.sessionVariables = {
      QT_AUTO_SCREEN_SCALE_FACTOR = 1;
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
      QT_QPA_PLATFORMTHEME = "qt5ct";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SCREENSHOTS_DIR = "$HOME/Pictures/ScreenShots";
      BROWSER = "firefox";
      EDITOR = "vim";
      GTK_THEME = "Orchis-Red";
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
    xdg.mimeApps = {
      enable = true;
      associations.added = {
        "text/html" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "application/x-extension-htm" = ["firefox.desktop"];
        "application/x-extension-html" = ["firefox.desktop"];
        "application/x-extension-shtml" = ["firefox.desktop"];
        "application/xhtml+xml" = ["firefox.desktop"];
        "application/x-extension-xhtml" = ["firefox.desktop"];
        "application/x-extension-xht" = ["firefox.desktop"];
      };
      defaultApplications = {
        "text/html" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "application/x-extension-htm" = ["firefox.desktop"];
        "application/x-extension-html" = ["firefox.desktop"];
        "application/x-extension-shtml" = ["firefox.desktop"];
        "application/xhtml+xml" = ["firefox.desktop"];
        "application/x-extension-xhtml" = ["firefox.desktop"];
        "application/x-extension-xht" = ["firefox.desktop"];
      };
    };

    gtk = {
      enable = true;
      theme.name = "Orchis-Red";
      iconTheme.name = "Papirus";
      cursorTheme.name = "Bibata-Original-Classic";
      cursorTheme.size = 32;
      font.name = "PT Sans Caption";
      font.size = 14;
    };
  };
}
