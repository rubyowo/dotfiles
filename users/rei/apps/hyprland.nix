{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [hyprland.homeManagerModules.default];

  wayland.windowManagers.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ../confs/hypr/hyprland.conf;
  };

  home.packages = with pkgs; [
    hyprpaper
    grim
    slurp
    wf-recorder
    brightnessctl
    pamixer
    wl-clipboard
  ];

  xdg.configFile."hypr/hyprpaper.conf".text =
    builtins.readFile ../confs/hypr/hyprpaper.conf;
  xdg.configFile."hypr/frappe.conf".text =
    builtins.readFile ../confs/hypr/frappe.conf;
}
