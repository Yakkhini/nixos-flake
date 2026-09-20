{config, ...}: {
  flake.modules.nixos.common = {
    imports = [
      config.flake.modules.nixos.nix

      config.flake.modules.nixos.users
      config.flake.modules.nixos.network
      config.flake.modules.nixos.fonts
      config.flake.modules.nixos.pkgs
      config.flake.modules.nixos.i18n
    ];

    # Set your time zone.
    time.timeZone = "Asia/Shanghai";

    # Documentation.
    documentation.enable = true;
    documentation.dev.enable = true;
  };
}
