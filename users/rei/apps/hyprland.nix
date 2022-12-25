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
    imv
    mpv
    libsForQt5.qt5ct
    lightly-qt
  ];

  # tf is a home-manager module? i wouldn't know. Im literally crying right now. My mental health is not stable at all. I just want the fooking home-manager module to work, please, i beg. I'll literally do anything. I just want it to work aaaaaaaaaaaaaaaaaaaaaaaa
  xdg.configFile."hypr/hyprland.conf".text =
    builtins.readFile ../confs/hypr/hyprland.conf;

  xdg.configFile."hypr/hyprpaper.conf".text =
    builtins.readFile ../confs/hypr/hyprpaper.conf;
  xdg.configFile."hypr/frappe.conf".text =
    builtins.readFile ../confs/hypr/frappe.conf;
  xdg.configFile."qt5ct/colors/Catppuccin-Frappe.conf".text =
    builtins.readFile "${(pkgs.callPackage ../packages/catppuccin-qt5ct {})}/share/qt5ct/colors/Catppuccin-Frappe.conf";

  systemd.user.targets.hyprland-session = {
    Unit = {
      Description = "hyprland compositor session";
      BindsTo = ["graphical-session.target"];
      Wants = ["graphical-session-pre.target"];
      After = ["graphical-session-pre.target"];
    };
  };
}
