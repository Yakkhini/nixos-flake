{
  config,
  lib,
  pkgs,
  ...
}: {
  # Mount Disks
  fileSystems."/mnt/c" = {
    device = "/dev/nvme0n1p3";
    noCheck = true;
    options = ["rw" "noatime"];
  };

  fileSystems."/mnt/d" = {
    device = "/dev/nvme0n1p5";
    noCheck = true;
    options = ["uid=yakkhini" "gid=users" "rw" "noatime"];
  };
}
