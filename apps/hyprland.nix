{
  config,
  pkgs,
  inputs,
  ...
}: let
  flake-compat =
    builtins.fetchTarball
    "https://github.com/edolstra/flake-compat/archive/master.tar.gz";

  hyprland =
    (import flake-compat {
      src =
        builtins.fetchTarball
        "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
    })
    .defaultNix;

  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure-gtk";
    executable = true;
    text = let
      schema = pkgs.gsettings-desktop-schemas;
      datadir = "${schema}/share/gsettings-schemas/${schema.name}";
    in ''
      export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
      gnome_schema=org.gnome.desktop.interface
      gsettings set $gnome_schema cursor-theme 'Catppuccin-Frappe-Sky'
    '';
  };
in {
  imports = [hyprland.homeManagerModules.default];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ../confs/hypr/hyprland.conf;
    systemdIntegration = true;
  };

  home.packages = with pkgs; [
    hyprpaper
    grim
    slurp
    wf-recorder
    brightnessctl
    pamixer
    wl-clipboard
    configure-gtk
  ];

  xdg.configFile."hypr/hyprpaper.conf".text =
    builtins.readFile ../confs/hypr/hyprpaper.conf;
  xdg.configFile."hypr/frappe.conf".text =
    builtins.readFile ../confs/hypr/frappe.conf;
}
