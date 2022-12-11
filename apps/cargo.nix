{
  config,
  lib,
  pkgs,
  ...
}: let
  fenix = import (fetchTarball "https://github.com/nix-community/fenix/archive/main.tar.gz") {};
in {
  home.packages = [
    fenix.default.toolchain
    fenix.rust-analyzer
  ];

  programs.cargo = {
    enable = true;
    settings = {
      net = {
        git-fetch-with-cli = true;
      };
    };
  };
}
