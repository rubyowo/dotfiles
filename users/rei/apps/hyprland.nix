{
  config,
  pkgs,
  lib,
  ...
}:  
/* let
  flake-compat = builtins.fetchTarball {
    url = "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
    sha256 = "sha256-Ht91NGdewz8IQLtWZ9LCeNXMSXHUss+9COoqu6JLmXU=";
    };

  hyprland = (import flake-compat {
    src = builtins.fetchTarball {
        url = "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
        sha256 = "sha256-3LmSPx6/8xp06L/QaCwkxn804gJ3QaSsZKY3kiCIHNE=";
    };
  }).defaultNix;
in */
{
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
