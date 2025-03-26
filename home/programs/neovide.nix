{pkgs, ...}: {
  programs.neovide = {
    enable = true;
    settings = {
      font = {
        normal = ["MonaspiceAr Nerd Font Propo"];
        italic = {
          family = "MonaspiceRn Nerd Font Propo";
        };
        bold = {
          family = "MonaspiceKr Nerd Font Propo";
        };
        size = 14.0;
      };
    };
  };
}
