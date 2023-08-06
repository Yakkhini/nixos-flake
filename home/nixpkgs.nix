{
  pkgs,
  hyprwm-contrib,
  ...
}: {
  nixpkgs.overlays = [
    hyprwm-contrib.overlays.default
  ];
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      papirus-icon-theme = pkgs.papirus-icon-theme.override {
        color = "red";
      };
    };
  };
}
