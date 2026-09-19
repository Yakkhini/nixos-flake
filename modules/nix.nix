{inputs, ...}: {
  flake.modules.nixos.nix = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      inputs.nur.modules.nixos.default
    ];

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
  };
}
