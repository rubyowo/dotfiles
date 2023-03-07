# XDG settings
{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [xdg-utils];
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;

      download = "${config.home.homeDirectory}/downloads";
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";

      publicShare = "${config.home.homeDirectory}/.local/public";
      templates = "${config.home.homeDirectory}/.local/templates";

      music = "${config.home.homeDirectory}/media/music";
      pictures = "${config.home.homeDirectory}/media/pictures";
      videos = "${config.home.homeDirectory}/media/videos";
    };

    mimeApps = {
      enable = true;
      defaultApplications = {"text/html" = ["firefox.desktop"];};
    };

    stateHome = "${config.home.homeDirectory}/.local/state";
  };
}
