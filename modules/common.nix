{
  config,
  inputs,
  ...
}: {
  flake.modules.nixos.common = {
    imports = [
      config.flake.modules.nixos.nix

      ../system/users.nix
      ../system/network.nix
      ../system/fonts.nix
      ../system/pkgs.nix
      ../system/i18n.nix
    ];

    # Set your time zone.
    time.timeZone = "Asia/Shanghai";

    # Documentation.
    documentation.enable = true;
    documentation.dev.enable = true;
  };
}
