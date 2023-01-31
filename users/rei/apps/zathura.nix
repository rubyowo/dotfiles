{
  config,
  pkgs,
  ...
}: {
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      recolor-reverse-video = true;
      guioptions = "none";
      selection-clipboard = "clipboard";
    };
    extraConfig = "include catppuccin";
  };

  xdg.configFile."zathura/catppuccin".text = builtins.readFile ../confs/zathura/catppuccin-mocha;
}
