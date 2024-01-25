{pkgs, ...}: {
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
    prezto = {
      enable = true;
      prompt.theme = "pure";
    };
  };
}
