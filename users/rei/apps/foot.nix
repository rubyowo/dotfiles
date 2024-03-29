{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [libsixel];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        include = "${config.xdg.configHome}/foot/mocha.ini";
        font = "FantasqueSansMono Nerd Font Mono:size=10";
        font-bold = "FantasqueSansMono Nerd Font Mono:size=10:style=Bold";
        font-italic = "FantasqueSansMono Nerd Font Mono:size=10:style=Italic";
        font-bold-italic = "FantasqueSansMono Nerd Font Mono:size=8:style=Bold Italic";
      };
      mouse.hide-when-typing = "yes";
    };
  };
  xdg.configFile."foot/mocha.ini".text =
    builtins.readFile ../confs/foot/mocha.ini;
}
