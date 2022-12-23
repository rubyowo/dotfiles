{ configs, pkgs, lib, ...}:
{
    xdg.configFile."cava/config".text = builtins.readFile ../confs/cava/config;
}
