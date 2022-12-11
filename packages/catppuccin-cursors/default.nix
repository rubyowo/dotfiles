{ lib, stdenv, fetchzip, ... }:
stdenv.mkDerivation rec {
  pname = "catppuccin-cursors";
  version = "0.2.0";

  src = fetchzip {
    url = "https://github.com/catppuccin/cursors/releases/download/v${version}/Catppuccin-Frappe-Sky-Cursors.zip";
    sha256 = "HJE5cWjbJf86OXDYAfir1YTT8uaNW0m7CuA8TGSrFJg=";
  };

  installPhase = ''
    mkdir -p $out/share/icons/Catppuccin-Frappe-Sky
    cp -va index.theme cursors $out/share/icons/Catppuccin-Frappe-Sky
  '';

  meta = {
    description = "Soothing pastel mouse cursors";
    homepage = "https://github.com/catppuccin/cursors";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
    maintainers = [ lib.maintainers.rubyowo ];
  };
}
