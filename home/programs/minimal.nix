{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./helix.nix
    ./direnv.nix
    ./vim.nix
    ./nixvim.nix
    ./shelltools.nix
    ./ssh.nix
    ./zsh.nix
    ./git.nix
  ];
}
