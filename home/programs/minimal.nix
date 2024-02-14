{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./helix.nix
    ./vim.nix
    ./zsh.nix
    ./git.nix
  ];
}
