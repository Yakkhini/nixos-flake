{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./helix.nix
    ./direnv.nix
    ./vim.nix
    ./zsh.nix
    ./git.nix
  ];
}
