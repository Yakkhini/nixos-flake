{
  config,
  nur,
  pkgs,
  ...
}: {
  home.packages = [
    # Security
    pkgs.gopass
    pkgs.gopass-jsonapi
  ];
}
