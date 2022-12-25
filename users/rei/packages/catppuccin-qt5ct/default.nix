{
  pkgs,
  lib,
  stdenv,
  fetchzip,
  ...
}:
stdenv.mkDerivation rec {
    name = "catppuccin-qt5ct";
    src = fetchzip {
        url = "https://github.com/catppuccin/qt5ct/archive/refs/heads/main.zip";
        sha256 = "sha256-ctmTIjZ2AfuP60iKxc2NVmMpMhm1sIHRj+Gk4rni2OU=";
    };

    installPhase = ''
      mkdir -p $out/share/qt5ct/colors
      cp -r *.conf $out/share/qt5ct/colors
    '';
}
