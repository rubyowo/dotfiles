{
  config,
  pkgs,
  lib,
  ...
}: {
  home-manager.users.rei = {
    home = {
      inherit (config.system) stateVersion;
      username = "rei";
      homeDirectory = "/home/rei";
    };

    imports = [
      ./apps
      ./packages
      ./env.nix
    ];
  };
}
