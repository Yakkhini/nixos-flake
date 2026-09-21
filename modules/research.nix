{...}: {
  flake.modules.homeManager.research = {pkgs, ...}: {
    home.packages = [
      pkgs.obsidian
      pkgs.vscode-fhs
      pkgs.zotero
      pkgs.typst
      pkgs.tinymist
      pkgs.typstyle
    ];
  };
}
