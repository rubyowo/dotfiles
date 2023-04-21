{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    seatd
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
    neovim-unwrapped
    playerctl
    cachix
    cava
    swaylock-effects
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    winetricks
    lutris
    zathura
    keepassxc
    (rust-bin.stable.latest.default.override {extensions = ["rust-src"];})
    rust-analyzer
    direnv
    mpd-mpris
    syncthing
    virtmanager
    gnome.seahorse

    inputs.catppuccin-toolbox.packages.${pkgs.system}.puccinier
    inputs.catppuccin-toolbox.packages.${pkgs.system}.catwalk

    (pkgs.callPackage ./podman-compose {})

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
    curlie
  ];
}
