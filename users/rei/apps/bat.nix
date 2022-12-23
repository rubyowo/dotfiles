{ config, pkgs, lib, ... }:
{
    xdg.configFile."bat/themes/frappe.tmTheme".text = builtins.readFile ../confs/bat/frappe.tmTheme;
}
