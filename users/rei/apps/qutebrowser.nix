{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.qutebrowser = {
    enable = false;
    package = pkgs.qutebrowser-qt6.override {
      enableWideVine = true;
    };
    searchEngines = {
      nw = "https://nixos.wiki/index.php?search={}";
    };
    settings = {
      colors.webpage = {
        preferred_color_scheme = "dark";
        darkmode.enabled = true;
      };
      url.default_page = "https://rubyowo.github.io/Bento/";
    };
    keyBindings = {
      normal = {
        "]p" = "tab-next";
        "[p" = "tab-prev";
        ",m" = "spawn mpv {url}";
        ",M" = "hint links spawn mpv {hint-url}";
      };
    };
    loadAutoconfig = true;
    extraConfig = builtins.readFile ../confs/qutebrowser/config.py;
  };

  xdg.configFile."qutebrowser/catppuccin".source = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "qutebrowser";
    rev = "main";
    sha256 = "sha256-E0A78pmb5CA/Pst3u9GJKmhp+5bMqZKf8CKJCS4JYls=";
  };
}
