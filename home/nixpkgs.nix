{
  pkgs,
  config,
  nur,
  hyprwm-contrib,
  ...
}: {
  nixpkgs.overlays = [
    hyprwm-contrib.overlays.default
  ];
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "openssl-1.1.1w"
    ];
    packageOverrides = pkgs: {
      papirus-icon-theme = pkgs.papirus-icon-theme.override {
        color = "red";
      };
      fcitx5-rime = pkgs.fcitx5-rime.override {
        librime = nur.legacyPackages."x86_64-linux".repos.xddxdd.lantianCustomized.librime-with-plugins;
      };
    };
  };
}
