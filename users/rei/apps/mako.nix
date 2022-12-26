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

    backgroundColor = "#24273a";
    textColor = "#cad3f5";
    borderColor = "#f5bde6";
    progressColor = "#363a4f";
  };
}
