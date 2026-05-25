{...}: {
  # Mount Disks
  fileSystems."/mnt/c" = {
    device = "/dev/nvme0n1p3";
    fsType = "ntfs";
    noCheck = true;
    options = ["rw" "noatime" "X-fstrim.notrim"];
  };

  fileSystems."/mnt/d" = {
    device = "/dev/nvme0n1p5";
    fsType = "ntfs";
    noCheck = true;
    options = ["uid=yakkhini" "gid=users" "rw" "noatime" "X-fstrim.notrim"];
  };
}
