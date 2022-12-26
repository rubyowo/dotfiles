{
  pkgs,
  config,
  ...
}: {
  config.gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Standard-Pink-Dark";
      package = pkgs.callPackage ../packages/catppuccin-gtk {};
    };
    iconTheme = {
      package = pkgs.rubyowo.catppuccin-papirus-folders.override {flavor = "macchiato"; accent = "pink";};
      name = "Papirus";
    };
    font = {
      name = "FantasqueSansMono Nerd Font";
      size = 13;
    };
    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk2.extraConfig = ''
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';
  };

  # cursor theme
  config.home.file.".icons/default".source = "${(pkgs.callPackage ../packages/catppuccin-cursors {}).macchiatoPink}/share/icons/Catppuccin-Macchiato-Pink-Cursors";
}
