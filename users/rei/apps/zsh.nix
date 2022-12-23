# ZSH settings
{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Aliases
    shellAliases = {
      lg = "lazygit";
      nix-clean = "sudo nix-collect-garbage -d && sudo nix-store --optimise";
      nix-switch = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nixos/flake.nix#selene";

      # Modern unix
      grep = "rg $@";
      find = "fd $@";
      df = "duf $@";
      ls = "exa $@";
      cat = "bat $@";
      dig = "dog $@";
    };

    envExtra = ''
      export MCFLY_KEY_SCHEME=vim
      export MCFLY_DISABLE_MENU=TRUE
      export BAT_THEME="frappe"
    '';

    initExtra = ''
      eval "$(mcfly init zsh)"
      eval "$(starship init zsh)"
    '';

    profileExtra = ''
    if [ "$(tty)" = "/dev/tty1" ]; then;
        exec Hyprland
    fi
    '';

    plugins = [
      {
        name = "zsh-defer";
        src = pkgs.fetchFromGitHub {
          owner = "romkatv";
          repo = "zsh-defer";
          rev = "master";
          sha256 = "/rcIS2AbTyGw2HjsLPkHtt50c2CrtAFDnLuV5wsHcLc=";
        };
      }
      {
        name = "zsh-autosuggestions";
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "zsh-nix-shell";
        file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
        src = pkgs.zsh-nix-shell;
      }
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
      {
        name = "catppuccin-zsh-syntax-hightlighting";
        src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "zsh-syntax-highlighting";
            rev = "dbb1ec93b30dbe8cd728cffe0974aa7fa1ac3298";
            sha256 = "0B7g0J6+ZCoe1eErsSEmqO0aNOBi+FB+///vXnuiels=";
        };
        file = "themes/catppuccin_frappe-zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
        src = pkgs.zsh-syntax-highlighting;
      }
    ];
  };
  home.packages = with pkgs; [
    zsh-nix-shell
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
