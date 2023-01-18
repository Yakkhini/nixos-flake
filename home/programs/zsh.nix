{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
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
