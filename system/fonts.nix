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
    noto-fonts-color-emoji
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
      monospace = ["Monaspace Neon" "Symbols Nerd Font Mono" "OpenMoji Color" "Source Han Mono SC"];
      sansSerif = ["IBM Plex Sans" "OpenMoji Color" "Source Han Sans SC" "Symbols Nerd Font Mono"];
      serif = ["IBM Plex Serif" "OpenMoji Color" "Source Han Serif SC" "Symbols Nerd Font Mono"];
    };
  };
}
