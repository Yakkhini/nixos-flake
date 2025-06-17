{...}: {
  programs.zed-editor.installRemoteServer = true;
  programs.zed-editor.enable = true;
  programs.zed-editor.extensions = [
    "catppuccin"
    "make"
    "nix"
    "scala"
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
    vim_mode = true;
    vim = {
      default_mode = "helix_normal";
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
}
