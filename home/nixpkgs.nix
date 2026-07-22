{
  llm-agents,
  nur,
  ...
}: {
  nixpkgs.overlays = [llm-agents.overlays.shared-nixpkgs];
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "openssl-1.1.1w"
    ];
    packageOverrides = pkgs: {
      fcitx5-rime = pkgs.fcitx5-rime.override {
        librime = nur.legacyPackages."x86_64-linux".repos.xddxdd.lantianCustomized.librime-with-plugins;
      };
    };
  };
}
