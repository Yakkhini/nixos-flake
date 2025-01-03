{...}: {
  catppuccin.alacritty.enable = true;
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
      font = {
        normal.family = "Hack Nerd Font";
        size = 14.0;
      };
    };
  };
}
