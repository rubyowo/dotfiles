{
  config,
  pkgs,
  lib,
  inputs,
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
    wtype
    imv
    mpv
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ../confs/hypr/hyprland.conf;
  };
  
  xdg.configFile."hypr/hyprpaper.conf".text =
    builtins.readFile ../confs/hypr/hyprpaper.conf;
  xdg.configFile."hypr/macchiato.conf".text =
    builtins.readFile ../confs/hypr/macchiato.conf;
}
