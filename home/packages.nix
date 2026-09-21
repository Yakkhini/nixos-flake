{
  pkgs,
  zen-browser,
  ...
}: {
  home.packages = [
    # Tool
    pkgs.just
    pkgs.kalker # Calculator
    pkgs.p7zip
    pkgs.alejandra
    pkgs.ueberzugpp # Image Preview for alacritty
    pkgs.hydra-check # Check the status of hydra jobs
    pkgs.podman-tui
    pkgs.podman-compose

    # Browsers
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
