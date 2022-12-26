{ lib, stdenv, pkgs, fetchzip }:

stdenv.mkDerivation rec {
  name = "catppuccin-gtk";

  src = fetchzip {
    url = "https://github.com/catppuccin/gtk/releases/download/v0.4.0/Catppuccin-Macchiato-Standard-Pink-Dark.zip";
    sha256 = "sha256-qDXlGpFQNYiBrCHMmb5cp9t22pAacVJoaqcC96CSGbI=";
    stripRoot = false;
  };

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r Catppuccin-Macchiato-Standard-Pink-Dark $out/share/themes
  '';

  meta = with lib; {
    description = "Soothing pastel theme for GTK3";
    homepage = "https://github.com/catppuccin/gtk";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
    maintainers = [ maintainers.rubyowo ];
  };
}
