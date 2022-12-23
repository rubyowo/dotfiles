local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'git@github.com:folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

opts = {
  ui = {
    border = 'rounded',
  },
  git = {
    url_format = 'git@github.com:%s.git',
  },
  dev = {
    path = '~/projects',
  },
  defaults = {
    lazy = true,
  },
  -- Nix Moment
  lockfile = '~/nixos/users/rei/confs/nvim/lazy-lock.json',
}

plugins = {
  -- Stuff other plugins depend on
  'MunifTanjim/nui.nvim',
  'nvim-lua/plenary.nvim',

  -- Theme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    build = ':CatppuccinCompile',
  },

  -- LSP
  'neovim/nvim-lspconfig',
  'jose-elias-alvarez/null-ls.nvim',
  'rubyowo/lspdiags.nvim',
  -- CMP
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
  },
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
      'windwp/nvim-autopairs',
      'p00f/nvim-ts-rainbow',
    },
  },
  -- Language Specific
  'simrat39/rust-tools.nvim',
  -- Snippets
  'L3MON4D3/LuaSnip',
  -- Formatting
  'mhartington/formatter.nvim',
  -- UI Stuff
  'nvim-telescope/telescope.nvim',
  { 'stevearc/dressing.nvim', event = 'VeryLazy' },
  'nvim-neo-tree/neo-tree.nvim',
  'noib3/nvim-cokeline',
  'rcarriga/nvim-notify',
  -- Statusline
  { 'nvim-lualine/lualine.nvim', lazy = false },
  -- Git
  'lewis6991/gitsigns.nvim',
  -- Sessions
  { 'Shatur/neovim-session-manager', cmd = 'SessionManager' },
  -- Util
  'folke/todo-comments.nvim',
  'numToStr/Comment.nvim',
  'ggandor/leap.nvim',
  'beauwilliams/focus.nvim',
  { 'famiu/bufdelete.nvim', cmd = 'Bdelete' },
  'numToStr/FTerm.nvim',
  { 'sindrets/winshift.nvim', cmd = 'WinShift' },
  { url = 'https://gitlab.com/yorickpeterse/nvim-pqf' },
  'gbprod/cutlass.nvim',
  'kylechui/nvim-surround',
  { 'nullishamy/autosave.nvim', branch = 'dev' },
  'karb94/neoscroll.nvim',
  -- Misc
  'nathom/filetype.nvim',
  'andweeb/presence.nvim',
  'kyazdani42/nvim-web-devicons', -- must be loaded last
}

require('lazy').setup(plugins, opts)
