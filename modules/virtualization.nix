{...}: {
  flake.modules.nixos.virtualization = {
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;

    # Podman
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
