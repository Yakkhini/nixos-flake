{pkgs, ...}: {
  # Additional: programs/email.nix

  accounts.email.accounts.yechanv = {
    primary = true;
    userName = "sign@yechanv.cc";
    passwordCommand = "echo test";
    realName = "Yaksis";
    address = "sign@yechanv.cc";

    imap = {
      host = "mx1.yechanv.cc";
      port = 993;
      tls.enable = true;
    };

    smtp = {
      host = "mx1.yechanv.cc";
      port = 465;
      tls.enable = true;
    };

    msmtp = {
      enable = true;
      extraConfig = {
        auth = "login";
      };
    };

    neomutt = {
      enable = true;
    };
  };

  accounts.email.maildirBasePath = "Public/Mail";
}
