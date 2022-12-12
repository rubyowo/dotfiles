{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      patchPhase = ''
        substituteInPlace src/modules/wlr/workspace_manager.cpp --replace "zext_workspace_handle_v1_activate(workspace_handle_);" "const std::string command = \"${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch workspace \" + name_; system(command.c_str());"
      '';
    });
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = ["wlr/workspaces"];
        modules-center = ["custom/music"];
        modules-right = ["pulseaudio" "network" "backlight" "battery" "clock" "tray" "custom/power"];

        "wlr/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = "{icon}";
          format-icons = {default = "";};
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        "custom/music" = {
          format = "  {}";
          escape = true;
          interval = 5;
          tooltip = false;
          exec = "${pkgs.playerctl}/bin/playerctl metadata --format '{{ title }}'";
          max-length = 50;
        };

        clock = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format-alt = " {:%d/%m/%Y}";
          format = " {:%H:%M}";
        };

        network = {
            format-wifi = "";
            format-disconnected = "";
            format-ethernet = "";
            format-alt = "  {signalStrength}%";
            tootip = false;
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          format-alt = "{icon} {percent}%";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "";
          format-plugged = "";
          format-alt = "{icon} {capacity}%";
          format-icons = ["" "" "" "" "" "" "" "" "" "" "" ""];
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = ["" "" " "];
          on-click = "pavucontrol";
        };

        "custom/power" = {
          tooltip = false;
          on-click = "bash ~/.config/rofi/scripts/powermenu.sh";
          format = "襤";
        };
      };
    };
  };

  xdg.configFile."waybar/style.css".text =
    builtins.readFile ../confs/waybar/style.css;
  xdg.configFile."waybar/frappe.css".text =
    builtins.readFile ../confs/waybar/frappe.css;
}
