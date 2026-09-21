{
  config,
  inputs,
  ...
}: {
  flake.modules.nixos.nix = {
    home-manager.sharedModules = [
      inputs.nix-index-database.homeModules.nix-index
      config.flake.modules.homeManager.nix
    ];

    imports = [
      inputs.home-manager.nixosModules.home-manager
      inputs.nur.modules.nixos.default
    ];

    nix.registry.pkgs.flake = inputs.nixpkgs-unfree; # Only use nixpkgs-unfree for registry

    nix.settings.substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
    ];
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nix.settings.trusted-users = ["root" "@wheel"];
    nix.settings.extra-substituters = [
      "https://noctalia.cachix.org"
      "https://cache.numtide.com"
      "https://yakkhini.cachix.org"
    ];
    nix.settings.extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
      "yakkhini.cachix.org-1:VEkiR+cHXNFEpx4XosK1aC0N1AgzZj5EEBOVH3EbcEs="
    ];

    # Systemwide nixpkgs config
    nixpkgs.config = {
      allowUnfree = true;
    };

    programs.nix-ld.enable = true;
  };

  flake.modules.homeManager.nix = {
    nixpkgs.overlays = [
      inputs.llm-agents.overlays.shared-nixpkgs
    ];

    nixpkgs.config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "dingtalk-8.2.8.260818002"
      ];
      packageOverrides = pkgs: {
        fcitx5-rime = pkgs.fcitx5-rime.override {
          librime = inputs.nur.legacyPackages."x86_64-linux".repos.xddxdd.lantianCustomized.librime-with-plugins;
        };
      };
    };

    programs.nix-index.enable = true;
    programs.nix-index-database.comma.enable = true;

    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
