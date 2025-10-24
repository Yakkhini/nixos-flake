{pkgs, ...}: {
  # fonts
  fonts.packages = with pkgs; [
    nerd-fonts.monaspace
    nerd-fonts.symbols-only
    times-newer-roman
    atkinson-hyperlegible-next
    atkinson-hyperlegible
    stix-two
    openmoji-color
    monaspace
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    source-han-sans
    source-han-serif
    source-han-mono
    ibm-plex
    dina-font
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["OpenMoji Color"];
      monospace = ["Monaspace Neon" "OpenMoji Color" "Symbols Nerd Font Mono" "Source Han Mono SC"];
      sansSerif = ["IBM Plex Sans" "OpenMoji" "Symbols Nerd Font Mono" "Source Han Sans SC"];
      serif = ["IBM Plex Serif" "OpenMoji" "Symbols Nerd Font Mono" "Source Han Serif SC"];
    };
  };
}
