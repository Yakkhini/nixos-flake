{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "rose_pine_dawn";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
  };
}
