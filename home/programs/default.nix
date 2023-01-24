{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./emacs.nix
    ./email.nix
    ./git.nix
    ./swaylock.nix
    ./vim.nix
    ./waybar.nix
    ./zsh.nix
  ];
}
