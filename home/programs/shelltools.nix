{...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    catppuccin.enable = true;
  };

  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  programs.navi.enable = true;

  programs.ripgrep.enable = true;
  programs.fd.enable = true;
}
