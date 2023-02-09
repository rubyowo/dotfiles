{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  _ = lib.getExe;
  screenshotScript = let
    inherit (pkgs) wayshot slurp;
  in
    pkgs.writeShellScriptBin "wayshot-ss" ''
    WORKSPACES="$(hyprctl monitors -j | jq -r 'map(.activeWorkspace.id)')"
    WINDOWS="$(hyprctl clients -j | jq -r --argjson workspaces "$WORKSPACES" 'map(select([.workspace.id] | inside($workspaces)))' )"
    GEOM=$(echo "$WINDOWS" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | ${_ slurp} -f '%x %y %w %h')
    ${_ wayshot} -s "$GEOM" --stdout ''${#:+"$@"}
    '';
  ocrScript = let
    inherit (pkgs) tesseract5 wl-clipboard;
  in
    pkgs.writeShellScriptBin "wl-ocr" ''
      ${_ screenshotScript} -e ppm | ${_ tesseract5} - - | ${wl-clipboard}/bin/wl-copy
    '';
  qrScript = let
    inherit (pkgs) zbar wl-clipboard;
  in
    pkgs.writeShellScriptBin "wl-qr" ''
      ${_ screenshotScript} -e ppm | ${_ zbar} -q - | sed "s/QR-Code://" | ${wl-clipboard}/bin/wl-copy
    '';
in {
  home.packages = with pkgs; [
    inputs.hyprpaper.packages.${pkgs.system}.hyprpaper
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    wf-recorder
    brightnessctl
    pamixer
    wl-clipboard
    wtype
    imv
    mpv
    screenshotScript
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
