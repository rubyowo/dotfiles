{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    seatd
    /* (discord-canary.override {
      withOpenASAR = true;
    }) */
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
    youtube-music
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    winetricks
    lutris
    zathura
    keepassxc
    (rust-bin.stable.latest.default.override {extensions = ["rust-src"];})
    rust-analyzer
    direnv
    mpd-mpris

    inputs.catppuccin-toolbox.packages.${pkgs.system}.puccinier
    inputs.catppuccin-toolbox.packages.${pkgs.system}.catwalk

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
