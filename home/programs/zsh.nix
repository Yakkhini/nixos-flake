{pkgs, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch = {
      enable = true;
      searchUpKey = "^[OA";
      searchDownKey = "^[OB";
    };
  };
}
