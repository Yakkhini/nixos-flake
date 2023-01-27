{
  pkgs,
  nix-doom-emacs,
  ...
}: {
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ../config/doom.d; # Directory containing your config.el, init.el
    # and packages.el files
  };
}
