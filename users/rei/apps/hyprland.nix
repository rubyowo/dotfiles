{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  ocrScript = let
    inherit (pkgs) grim slurp tesseract5 wl-clipboard;
    _ = lib.getExe;
  in
    pkgs.writeShellScriptBin "wl-ocr" ''
      ${_ grim} -g "$(${_ slurp})" -t ppm - | ${_ tesseract5} - - | ${wl-clipboard}/bin/wl-copy
    '';
  qrScript = let
    inherit (pkgs) grim slurp zbar wl-clipboard;
    _ = lib.getExe;
  in
    pkgs.writeShellScriptBin "wl-qr" ''
      ${_ grim} -g "$(${_ slurp})" -t ppm - | ${_ zbar} -q - | sed "s/QR-Code://" | ${wl-clipboard}/bin/wl-copy
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
    qrScript
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ../confs/hypr/hyprland.conf;
  };

  xdg.configFile."hypr/hyprpaper.conf".text =
    builtins.readFile ../confs/hypr/hyprpaper.conf;
  xdg.configFile."hypr/mocha.conf".text =
    builtins.readFile ../confs/hypr/mocha.conf;
  xdg.configFile."swaylock/config".text =
    builtins.readFile ../confs/swaylock/config;
}
