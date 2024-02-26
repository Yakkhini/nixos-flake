{
  config,
  lib,
  pkgs,
  nur,
  ...
}: {
  imports = [
    ./users.nix
    ./network.nix
    ./fonts.nix
    ./pkgs.nix
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {LANGUAGE = "en_US.UTF-8";};
  i18n.supportedLocales = ["en_US.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8"];
}
