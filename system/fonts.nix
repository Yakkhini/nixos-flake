{
  config,
  lib,
  pkgs,
  ...
}: {
  # fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode" "Hack" "DroidSansMono"];})
    times-newer-roman
    openmoji-color
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    source-han-sans
    source-han-serif
    source-han-mono
    paratype-pt-sans
    paratype-pt-serif
    paratype-pt-mono
    fira-code
    fira-code-symbols
    dina-font
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["OpenMoji Color"];
      monospace = ["Hack Nerd Font Mono" "Source Han Mono SC"];
      sansSerif = ["PT Sans" "Source Han Sans SC"];
      serif = ["PT Serif" "Source Han Serif SC"];
    };
  };
}
