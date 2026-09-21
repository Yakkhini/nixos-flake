{...}: {
  flake.modules.homeManager.shell = {pkgs, ...}: {
    programs.bash.enable = true;

    catppuccin.starship.enable = true;
    programs.starship = {
      enable = true;
      presets = ["nerd-font-symbols"];
    };

    programs.fzf.enable = true;
    programs.carapace.enable = true;
    programs.zoxide.enable = true;

    programs.navi.enable = true;

    programs.ripgrep.enable = true;
    programs.fd.enable = true;

    programs.opencode.enable = true;

    programs.zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch = {
        enable = true;
        searchUpKey = "^[OA";
        searchDownKey = "^[OB";
      };
      history.ignoreAllDups = true;
      history.ignoreSpace = true;
    };
  };
}
