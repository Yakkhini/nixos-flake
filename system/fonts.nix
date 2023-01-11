{
  config,
  lib,
  pkgs,
  ...
}: {
  # fonts
  fonts.fonts = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode" "Hack" "DroidSansMono"];})
    openmoji-color
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    source-han-sans
    source-han-serif
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
      monospace = ["Hack Nerd Font Mono" "Noto Sans Mono CJK SC"];
      sansSerif = ["PT Sans" "Noto Sans Mono CJK SC"];
      serif = ["PT Serif" "Noto Serif Mono CJK SC"];
    };
  };
}
