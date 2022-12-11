{ lib, stdenv, pkgs, fetchzip }:

stdenv.mkDerivation rec {
  name = "catppuccin-gtk";

  src = fetchzip {
    url = "https://github.com/catppuccin/gtk/releases/download/v0.3.1/Catppuccin-Frappe-Standard-Sky.zip";
    sha256 = "tzJnBH90slFN6cUtNmH1KXYh8uDeVJumW1JkwREU6RE=";
    stripRoot = false;
  };

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r Catppuccin-Frappe-Standard-Sky $out/share/themes
  '';

  meta = with lib; {
    description = "Soothing pastel theme for GTK3";
    homepage = "https://github.com/catppuccin/gtk";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
    maintainers = [ maintainers.rubyowo ];
  };
}
