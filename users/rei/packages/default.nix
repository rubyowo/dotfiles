{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    seatd
    btop
    neofetch
    lazygit
    lazydocker
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

    (callPackage ./catppuccin-gtk {})
    (callPackage ./catppuccin-cursors {}).frappeSky
    (callPackage ./grimblast {})
    (callPackage ./hyprpicker {})
  ];
}
