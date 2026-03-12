{
  config,
  lib,
  pkgs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  # Group "uinput" for sunshine external input devices support.
  #
  # TODO: No need to declare uinput group and enable `hardware.uinput`
  # manually after https://github.com/NixOS/nixpkgs/pull/493109 merged.
  users.users.root.initialHashedPassword = "";
  users.users.yakkhini = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["wheel" "networkmanager" "adbusers" "podman" "uinput"];
  };
}
