{...}: {
  flake.modules.homeManager.development = {pkgs, ...}: {
    home.packages = [
      #Code
      pkgs.llm-agents.omp
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
          normal = ["Monaspace Argon NF"];
          italic = {
            family = "Monaspace Radon NF";
          };
          bold = {
            family = "Monaspace Krypton NF";
          };
          size = 14.0;
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
      buffer_font_family = "Monaspace Argon NF";
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
