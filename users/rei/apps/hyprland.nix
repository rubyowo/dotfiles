{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  ocrScript = let
    inherit (pkgs) grim libnotify slurp tesseract5 wl-clipboard;
    _ = lib.getExe;
  in
    pkgs.writeShellScriptBin "wl-ocr" ''
      ${_ grim} -g "$(${_ slurp})" -t ppm - | ${_ tesseract5} - - | ${wl-clipboard}/bin/wl-copy
      ${_ libnotify} "$(${wl-clipboard}/bin/wl-paste)"
    '';
in {
  home.packages = with pkgs; [
    hyprpaper
    grim
    slurp
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    wf-recorder
    brightnessctl
    pamixer
    wl-clipboard
    wtype
    imv
    mpv
    ocrScript
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ../confs/hypr/hyprland.conf;
  };

  xdg.configFile."hypr/hyprpaper.conf".text =
    builtins.readFile ../confs/hypr/hyprpaper.conf;
  xdg.configFile."hypr/macchiato.conf".text =
    builtins.readFile ../confs/hypr/macchiato.conf;
  xdg.configFile."swaylock/config".text =
    builtins.readFile ../confs/swaylock/config;
}
