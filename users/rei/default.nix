{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  home-manager.users.rei = {
    home = {
      inherit (config.system) stateVersion;
      username = "rei";
      homeDirectory = "/home/rei";
    };

    _module.args = {inherit inputs;};

    imports = [
      inputs.hyprland.homeManagerModules.default
      ./env.nix
      ./apps
      ./packages
    ];
  };
}
