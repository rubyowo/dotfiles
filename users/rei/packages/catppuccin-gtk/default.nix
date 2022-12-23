{ lib, stdenv, pkgs, fetchzip }:

stdenv.mkDerivation rec {
  name = "catppuccin-gtk";

  src = fetchzip {
    url = "https://github.com/catppuccin/gtk/releases/download/v0.4.0/Catppuccin-Frappe-Standard-Sky-Dark.zip";
    sha256 = "sha256-4UTG7PdKiRPlNCXkBCzDr4RbyH+8M1UTSwOyk/kF3Y4=";
    stripRoot = false;
  };

  propagatedUserEnvPkgs = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r Catppuccin-Frappe-Standard-Sky-Dark $out/share/themes
  '';

  meta = with lib; {
    description = "Soothing pastel theme for GTK3";
    homepage = "https://github.com/catppuccin/gtk";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
    maintainers = [ maintainers.rubyowo ];
  };
}
