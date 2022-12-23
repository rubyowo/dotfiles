{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [ libnotify ];

  programs.mako = {
    enable = true;
    font = "FantasqueSansMono Nerd Font 12";
    margin = "0,20,20";
    padding = "10";
    borderSize = 2;
    borderRadius = 5;
    defaultTimeout = 10000;
    groupBy = "summary";

    backgroundColor = "#303446";
    textColor = "#c6d0f5";
    borderColor = "#99d1db";
    progressColor = "#414559";
  };
}
