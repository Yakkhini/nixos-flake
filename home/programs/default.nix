{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./emacs.nix
    # ./email.nix
    ./git.nix
    ./swaylock.nix
    ./vim.nix
    ./waybar.nix
    ./zsh.nix
  ];
}
