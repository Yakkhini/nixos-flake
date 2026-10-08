{inputs, ...}: {
  flake.modules.homeManager.development = {pkgs, ...}: {
    home.packages = [
      #Code
      inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.omp

      pkgs.ruby
      pkgs.ruby.gems.solargraph
      pkgs.gnumake
      pkgs.uv
      pkgs.ruff
      pkgs.nixd
      pkgs.rustup
      pkgs.clang
      pkgs.clang-tools
      pkgs.autocorrect
    ];

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
          features = let
            enabled = [
              "+calt"
              "+liga"
              "+ss01"
              "+ss02"
              "+ss03"
              "+ss04"
              "+ss05"
              "+ss06"
              "+ss07"
              "+ss08"
              "+ss09"
              "+ss10"
            ];
          in {
            "MonaspiceAr Nerd Font Mono" = enabled;
            "MonaspiceRn Nerd Font Mono" = enabled;
            "MonaspiceKr Nerd Font Mono" = enabled;
          };
        };
      };
    };

    programs.zed-editor.installRemoteServer = true;
    programs.zed-editor.enable = true;
    programs.zed-editor.extensions = [
      "catppuccin"
      "make"
      "nix"
      "ruff"
      "scala"
      "ty"
      "typst"
      "tcl"
      "verilog"
      "wakatime"
    ];
    programs.zed-editor.userSettings = {
      autosave = "on_focus_change";
      ui_font_family = "IBM Plex Sans";
      ui_font_size = 22;
      buffer_font_family = "MonaspiceAr Nerd Font Mono";
      buffer_font_size = 20;
      helix_mode = true;
      vim = {
        toggle_relative_line_numbers = true;
      };
      theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "One Dark";
      };
      languages = {
        Nix = {
          language_servers = ["nixd" "!nil"];
        };
      };
      base_keymap = "VSCode";
      features = {
        edit_prediction_provider = "copilot";
      };
    };

    programs.nushell = {
      enable = true;
    };
  };
}
