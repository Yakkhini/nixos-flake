{pkgs, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch = {
      enable = true;
      searchUpKey = "^[OA";
      searchDownKey = "^[OB";
    };
  };
}
