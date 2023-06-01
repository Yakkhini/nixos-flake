{
  config,
  lib,
  pkgs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.root.initialHashedPassword = "";
  users.users.yakkhini = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["wheel" "systemd-network" "adbusers" "docker"]; # Enable ‘sudo’ for the user.
  };
}
