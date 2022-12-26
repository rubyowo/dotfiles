{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = rec {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    TERMINAL = "foot";
    NIXOS_OZONE_WL = 1;
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };
}
