{pkgs, ...}: {
  programs.git = {
    enable = true;
    signing.key = "F27FB4A20C9CCAC0";
    signing.signByDefault = true;
    settings = {
      user.email = "59007159+Yakkhini@users.noreply.github.com";
      user.name = "Yaksis";
      init.defaultBranch = "main";
    };
  };

  programs.lazygit.enable = true;
  programs.delta.enable = true;
}
