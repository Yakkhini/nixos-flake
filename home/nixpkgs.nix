{
  llm-agents,
  nur,
  ...
}: {
  nixpkgs.overlays = [llm-agents.overlays.shared-nixpkgs];
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "dingtalk-8.2.8.260818002"
    ];
    packageOverrides = pkgs: {
      fcitx5-rime = pkgs.fcitx5-rime.override {
        librime = nur.legacyPackages."x86_64-linux".repos.xddxdd.lantianCustomized.librime-with-plugins;
      };
    };
  };
}
