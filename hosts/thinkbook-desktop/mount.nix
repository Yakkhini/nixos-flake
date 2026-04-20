{...}: {
  # Mount Disks
  fileSystems."/mnt/c" = {
    device = "/dev/nvme0n1p3";
    fsType = "auto";
    noCheck = true;
    options = ["rw" "noatime"];
  };

  fileSystems."/mnt/d" = {
    device = "/dev/nvme0n1p5";
    fsType = "auto";
    noCheck = true;
    options = ["uid=yakkhini" "gid=users" "rw" "noatime"];
  };
}
