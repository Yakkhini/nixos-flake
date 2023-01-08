{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: rec {
      hackneyed = pkgs.hackneyed.overrideAttrs (finalAttrs: previousAttrs: {
        buildFlags = [
          "-j20"
          "-B"
          "THEME_NAME=Hackneyed-Dark"
          "COMMON_SOURCE=theme/common-dark.svg"
          "RSVG_SOURCE=theme/right-handed-dark.svg"
          "LSVG_SOURCE=theme/left-handed-dark.svg"
          "theme"
          "theme.left"
        ];
      });
      papirus-icon-theme = pkgs.papirus-icon-theme.override {
        color = "adwaita";
      };
    };
  };
}
