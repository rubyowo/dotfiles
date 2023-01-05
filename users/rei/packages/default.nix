{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    seatd
    btop
    neofetch
    lazygit
    lazydocker
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
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    winetricks
    lutris
    zathura
    keepassxc

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
    (callPackage ./catppuccin-cursors {}).macchiatoPink
  ];
}
