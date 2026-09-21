{...}: {
  flake.modules.homeManager.communication = {pkgs, ...}: {
    home.packages = [
      pkgs.telegram-desktop
      pkgs.wemeet
      pkgs.feishu
      pkgs.nur.repos.yakkhini.dingtalk
      pkgs.wechat
      pkgs.thunderbird
    ];
  };
}
