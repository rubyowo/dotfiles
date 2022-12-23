{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    TERMINAL = "foot";
    NIXOS_OZONE_WL = 1;
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
  };
}
