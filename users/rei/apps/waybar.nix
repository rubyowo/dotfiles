{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        modules-left = ["wlr/workspaces"];
        modules-center = [];
        modules-right = ["pulseaudio" "network" "backlight" "battery" "clock" "tray" "custom/power"];

        "wlr/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = "{icon}";
          format-icons = {default = "";};
        };

        pulseaudio = {
          format = " {icon} ";
          format-muted = "ﱝ";
          format-icons = ["奄" "奔" "墳"];
          tooltip = true;
          tooltip-format = "{volume}%";
        };

        network = {
          format-wifi = " ";
          format-disconnected = "睊";
          format-ethernet = " ";
          tooltip = true;
          tooltip-format = "{signalStrength}%";
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          tooltip = true;
          tooltip-format = "{percent}%";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "";
          format-plugged = "";
          format-icons = ["" "" "" "" "" "" "" "" "" "" "" ""];
          tooltip = true;
          tooltip-format = "{capacity}%";
        };

        "custom/power" = {
          tooltip = false;
          on-click = "powermenu";
          format = "襤";
        };

        clock = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format-alt = ''
             {:%d
             %m
            %Y}'';
          format = ''
            {:%H
            %M}'';
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };
      };
    };

    style = builtins.readFile ../confs/waybar/style.css;
  };

  xdg.configFile."waybar/mocha.css".text =
    builtins.readFile ../confs/waybar/mocha.css;
}
