{
  pkgs,
  config,
  ...
}: {
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Frappe-Standard-Sky";
      package = pkgs.callPackage ../packages/catppuccin-gtk {};
    };
    iconTheme = {
      package = pkgs.callPackage ../packages/catppuccin-folders {};
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
  home.file.".icons/default".source = "${(pkgs.callPackage ../packages/catppuccin-cursors {})}/share/icons/Catppuccin-Frappe-Sky";
}
