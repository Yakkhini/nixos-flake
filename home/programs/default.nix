{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./direnv.nix
    #./emacs.nix
    # ./email.nix
    ./helix.nix
    ./git.nix
    ./swaylock.nix
    ./vim.nix
    ./waybar.nix
    ./zsh.nix
  ];
}
