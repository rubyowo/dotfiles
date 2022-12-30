{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./starship.nix
    ./gtk.nix
    ./git.nix
    ./xdg.nix
    ./lazygit.nix
    ./mpris.nix
    ./hyprland.nix
    ./waybar.nix
    ./mako.nix
    ./foot.nix
    ./rofi.nix
    ./nvim.nix
    ./rust.nix
    ./cava.nix
    ./bat.nix
    ./zathura.nix
  ];
}
