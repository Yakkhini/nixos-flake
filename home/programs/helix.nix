{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    catppuccin.enable = true;
    settings = {
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
  };
}
