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
  ];

  # tf is a home-manager module? i wouldn't know. Im literally crying right now. My mental health is not stable at all. I just want the fooking home-manager module to work, please, i beg. I'll literally do anything. I just want it to work aaaaaaaaaaaaaaaaaaaaaaaa
  xdg.configFile."hypr/hyprland.conf".text =
    builtins.readFile ../confs/hypr/hyprland.conf;

  xdg.configFile."hypr/hyprpaper.conf".text =
    builtins.readFile ../confs/hypr/hyprpaper.conf;
  xdg.configFile."hypr/macchiato.conf".text =
    builtins.readFile ../confs/hypr/macchiato.conf;

  systemd.user.targets.hyprland-session = {
    Unit = {
      Description = "hyprland compositor session";
      BindsTo = ["graphical-session.target"];
      Wants = ["graphical-session-pre.target"];
      After = ["graphical-session-pre.target"];
    };
  };
}
