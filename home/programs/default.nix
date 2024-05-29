{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./direnv.nix
    #./emacs.nix
    # ./email.nix
    ./helix.nix
    ./git.nix
    ./nixvim.nix
    ./shelltools.nix
    ./swaylock.nix
    ./tofi.nix
    ./vim.nix
    ./waybar.nix
    ./zsh.nix
  ];
}
