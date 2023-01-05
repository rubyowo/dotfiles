{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = rec {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    TERMINAL = "foot";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
    XCURSOR_SIZE = "34";
  };
}
