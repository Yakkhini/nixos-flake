{pkgs, ...}: {
  programs.neovide = {
    enable = true;
    settings = {
      font = {
        normal = ["MonaspiceAr Nerd Font Mono"];
        italic = {
          family = "MonaspiceRn Nerd Font Mono";
        };
        bold = {
          family = "MonaspiceKr Nerd Font Mono";
        };
        size = 14.0;
      };
    };
  };
}
