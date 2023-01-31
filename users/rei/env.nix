{
  config,
  pkgs,
  inputs,
  ...
}: {
  xdg.configFile."nix/inputs/nixpkgs".source = inputs.nixpkgs.outPath;
  nix.registry.nixpkgs.flake = inputs.nixpkgs;

  home.sessionVariables = rec {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    TERMINAL = "foot";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
    XCURSOR_SIZE = "34";
    NIX_PATH = "nixpkgs=${config.xdg.configHome}/nix/inputs/nixpkgs$\{NIX_PATH:+:$NIX_PATH}";
    TLDR_CACHE_DIR = config.xdg.cacheHome;
  };

  # disable man pages
  manual.manpages.enable = false;

  services.lorri.enable = true;
}
