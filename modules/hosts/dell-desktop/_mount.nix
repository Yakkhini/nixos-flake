{
  config,
  lib,
  pkgs,
  ...
}: {
  # Mount Disks
  fileSystems."/mnt/diskc" = {
    device = "/dev/nvme0n1p3";
    noCheck = true;
    options = ["rw" "noatime"];
  };
  fileSystems."/mnt/diskd" = {
    device = "/dev/sda2";
    noCheck = true;
    options = ["uid=yakkhini" "gid=users" "rw" "noatime"];
  };
  fileSystems."/mnt/diske" = {
    device = "/dev/sda3";
    noCheck = true;
    options = ["uid=yakkhini" "gid=users" "rw" "noatime"];
  };

  # Systemd tmpfiles.d
  systemd.tmpfiles.rules = ["w /sys/power/image_size - - - - 0"];
}
