# XDG settings
{
  config,
  lib,
  pkgs,
  ...
}: {
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;

      download = ~/downloads;
      desktop = ~/desktop;
      documents = ~/documents;

      publicShare = ~/.local/public;
      templates = ~/.local/templates;

      music = ~/media/music;
      pictures = ~/media/pictures;
      videos = ~/media/videos;
    };

    mimeApps = {
      enable = true;
      defaultApplications = {"text/html" = ["firefox.desktop"];};
    };
  };
}
