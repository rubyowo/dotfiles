{
  config,
  pkgs,
  ...
}: {
  programs.webcord = {
    enable = true;
    themes = let 
        catppuccin-ruby = pkgs.fetchFromGitHub {
          owner = "rubyowo";
          repo = "discord";
          rev = "mycss";
          sha256 = "sha256-33YDFRxSxWEFLFa/1arwmWIv6GAbKfwxR84/aS0Ia5Q=";
        };
    in {
        DiscordCSS = "${catppuccin-ruby}/themes/mine.theme.css";
    }; 
  };
}
