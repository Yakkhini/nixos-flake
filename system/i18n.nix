{
  config,
  lib,
  pkgs,
  ...
}: {
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {LANGUAGE = "en_US.UTF-8";};
  i18n.supportedLocales = ["en_US.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8"];

  # Input method has set in home manager
}
