{...}: {
  flake.modules.homeManager.shell = {...}: {
    programs.bash.enable = true;

    catppuccin.starship.enable = true;
    programs.starship = {
      enable = true;
      presets = ["nerd-font-symbols"];

      # Remove explicit VCS module declare after default list has it in the future
      # Ref: https://starship.rs/config/#vcs
      settings = {
        format = "$all$vcs$line_break$character";

        git_branch.disabled = true;
        git_commit.disabled = true;
        git_state.disabled = true;
        git_metrics.disabled = true;
        git_status.disabled = true;

        vcs.order = ["jj" "git" "hg" "pijul" "fossil"];
      };
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
