{pkgs, ...}: {
  catppuccin.alacritty.enable = true;
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
      font = {
        normal.family = "monospace";
        bold.family = "MonaspiceKr Nerd Font Mono";
        size = 14.0;
      };
    };
  };
}
