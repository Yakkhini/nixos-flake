{...}: {
  catppuccin.starship.enable = true;
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  programs.thefuck.enable = true;
  programs.navi.enable = true;

  programs.ripgrep.enable = true;
  programs.fd.enable = true;
}
