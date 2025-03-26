{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./direnv.nix
    ./email.nix
    ./helix.nix
    ./git.nix
    ./nixvim.nix
    ./nushell.nix
    ./shelltools.nix
    ./ssh.nix
    ./swaylock.nix
    ./tofi.nix
    ./vim.nix
    ./waybar.nix
    ./zsh.nix
  ];
}
