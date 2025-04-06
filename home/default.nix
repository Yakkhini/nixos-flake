{
  config,
  lib,
  pkgs,
  nixpkgs,
  home-manager,
  nur,
  catppuccin,
  nixvim,
  niri,
  specialArgs,
  ...
}: {
  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = true;

  home-manager.extraSpecialArgs = specialArgs;

  home-manager.users.yakkhini = {
    pkgs,
    nixpkgs,
    ...
  }: {
    nix.registry.pkgs.flake = nixpkgs;
    home.stateVersion = "22.11";
    imports = [
      nur.modules.homeManager.default
      catppuccin.homeModules.catppuccin
      nixvim.homeManagerModules.nixvim
      niri.homeModules.niri
      ./programs
      ./i18n.nix
      ./nixpkgs.nix
      ./packages.nix
      ./services.nix
      ./waylandSway.nix
      ./waylandHyprland
      ./waylandNiri
    ];

    catppuccin.flavor = "mocha";
    catppuccin.cursors = {
      accent = "dark";
      enable = true;
    };

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
      GTK_THEME = "Orchis-Red";
    };

    home.pointerCursor = {
      size = 32;
      hyprcursor.enable = true;
    };

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };

    catppuccin.gtk.icon = {
      enable = true;
      accent = "maroon";
    };
    gtk = {
      enable = true;
      theme.name = "Orchis-Red";
      font.name = "PT Sans Caption";
      font.size = 14;
    };
  };
}
