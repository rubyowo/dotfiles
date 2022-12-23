{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    hyprpaper
    grim
    slurp
    wf-recorder
    brightnessctl
    pamixer
    wl-clipboard
  ];

  # tf is a home-manager module? i wouldn't know.
  xdg.configFile."hypr/hyprland.conf".text =
    builtins.readFile ../confs/hypr/hyprland.conf;
  xdg.configFile."hypr/hyprpaper.conf".text =
    builtins.readFile ../confs/hypr/hyprpaper.conf;
  xdg.configFile."hypr/frappe.conf".text =
    builtins.readFile ../confs/hypr/frappe.conf;
}
