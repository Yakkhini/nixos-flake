{
  config,
  lib,
  pkgs,
  ...
}: {
  # fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.droid-sans-mono
    nerd-fonts.monaspace
    times-newer-roman
    openmoji-color
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    source-han-sans
    source-han-serif
    source-han-mono
    ibm-plex
    fira-code
    fira-code-symbols
    dina-font
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["OpenMoji Color"];
      monospace = ["MonaspiceNe Nerd Font Mono" "Source Han Mono SC"];
      sansSerif = ["IBM Plex Sans" "Source Han Sans SC"];
      serif = ["IBM Plex Serif" "Source Han Serif SC"];
    };
  };
}
