{pkgs, ...}: {
  programs.git = {
    enable = true;
    signing.key = "F27FB4A20C9CCAC0";
    signing.signByDefault = true;
    userEmail = "59007159+Yakkhini@users.noreply.github.com";
    userName = "Yaksis";
    extraConfig = {
      init.defaultBranch = "main";
    };
    delta.enable = true;
  };
  programs.gitui.enable = true;
}
