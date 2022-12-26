{ config, pkgs, lib, ... }:
{
    xdg.configFile."bat/themes/macchiato.tmTheme".text = builtins.readFile ../confs/bat/macchiato.tmTheme;
}
