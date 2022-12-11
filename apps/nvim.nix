{ pkgs, config, ... }: {
  xdg.configFile."nvim".source = ../confs/nvim;

  home.packages = with pkgs; [
    stylua
    nodePackages_latest.prettier
    black
    alejandra
    shfmt
    # rustfmt is provided by fenix

    selene
    nodePackages_latest.eslint_d
    shellcheck

    sumneko-lua-language-server
    nodePackages_latest.typescript-language-server
    nodePackages_latest.bash-language-server
    nodePackages_latest.pyright
    nodePackages.vscode-langservers-extracted
    nodePackages.yarn
    rnix-lsp
    # rust-analyzer is provided by fenix

    gcc
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    vimAlias = false;
    viAlias = false;
    vimdiffAlias = false;
    withRuby = false;
    withNodeJs = false;
    withPython3 = false;
  };
}
