{pkgs, ...}: {
  nixpkgs.overlays = [
    (self: super: {
      waybar-hyprland = super.waybar.overrideAttrs (oldAttrs: {
        postPatch = ''
          # use hyprctl to switch workspaces
          sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp
        '';
        mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      });
    })
  ];
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: rec {
      papirus-icon-theme = pkgs.papirus-icon-theme.override {
        color = "adwaita";
      };
    };
  };
}
