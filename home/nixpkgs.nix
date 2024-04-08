{
  pkgs,
  config,
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
      fcitx5-rime = pkgs.fcitx5-rime.override {
        librime = config.nur.repos.xddxdd.lantianCustomized.librime-with-plugins;
      };
    };
  };
}
