{
  config,
  pkgs,
  ...
}: let
  imports = [
    ../apps/zsh.nix
    ../apps/starship.nix
    ../apps/gtk.nix
    ../apps/git.nix
    ../apps/xdg.nix
    ../apps/lazygit.nix
    ../apps/mpris.nix
    ../apps/hyprland.nix
    ../apps/waybar.nix
    ../apps/mako.nix
    ../apps/foot.nix
    ../apps/rofi.nix
    ../apps/nvim.nix
    ../apps/cargo.nix
    ../apps/cava.nix

    ../packages/cargo.nix
  ];
  username = "rei";
in {
  inherit imports;
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "$username";
    homeDirectory = "/home/${username}";

    # ENV vars
    sessionVariables = {
      EDITOR = "nvim";
      GIT_EDITOR = "nvim";
      TERMINAL = "foot";
      PATH = ["\${HOME}/.cargo/bin"];
    };

    packages = with pkgs; [
      seatd
      btop
      neofetch
      lazygit
      discord
      gparted
      gimp
      pavucontrol
      mako
      foot
      zsh
      starship
      dconf
      fontconfig
      vim
      neovim-unwrapped
      firefox
      playerctl
      cachix
      cava
      swaylock-effects
      youtube-music

      # Modern unix
      ripgrep
      mcfly
      fd
      duf
      exa
      bat
      jq
      tldr
      dogdns
      httpie

      (callPackage ../packages/catppuccin-gtk {})
      (callPackage ../packages/catppuccin-cursors {})
      (callPackage ../packages/catppuccin-folders {})
      (callPackage ../packages/grimblast {})
    ];

    stateVersion = "22.05";
  };

  programs = {home-manager = {enable = true;};};

  nixpkgs.overlays = [
    (import ../overlays/electron.nix)
    (import ../overlays/discord.nix)
  ];
}
