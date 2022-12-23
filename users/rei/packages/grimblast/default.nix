{ lib, stdenv, fetchFromGitHub }:
stdenv.mkDerivation rec {
  pname = "grimblast";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "hyprwm";
    repo = "contrib";
    rev = "5b21c74a3200ffdd48ed7764c7041d43c3cd5588";
    sha256 = "sha256-gMH11FNZtnU7d+pIkwg9NmumJ6YvxyUP9Do43YKrd/E=";
  };

  installPhase = ''
    mkdir -p $out/bin
    mv grimblast/grimblast $out/bin 
    chmod +x $out/bin/grimblast
  '';

  meta = with lib; {
    description = "A helper for screenshots within hyprland, based on grimshot";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ misterio77 ];
  };
}
