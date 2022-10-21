local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

local packer = require('packer')
packer.startup(function(use)
  use({
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end,
  }) -- Improve loading time
  use('wbthomason/packer.nvim') -- Let packer manage itself

  -- Stuff other plugins depend on
  use('MunifTanjim/nui.nvim')
  use('nvim-lua/plenary.nvim')

  -- Theme
  use({
    'catppuccin/nvim',
    branch = 'cache',
    as = 'catppuccin',
    run = ':CatppuccinCompile',
  })

  -- LSP
  use('neovim/nvim-lspconfig')
  use('williamboman/mason.nvim')
  use('WhoIsSethDaniel/mason-tool-installer.nvim')
  use('jose-elias-alvarez/null-ls.nvim')
  use('rubyowo/lspdiags.nvim')

  -- CMP
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('saadparwaiz1/cmp_luasnip')

  -- Treesitter
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use('nvim-treesitter/nvim-treesitter-textobjects')
  use('windwp/nvim-ts-autotag')
  use('windwp/nvim-autopairs')
  use('p00f/nvim-ts-rainbow')

  -- Language Specific
  use('simrat39/rust-tools.nvim')
  use('~/zeppelin.nvim')

  -- Snippets
  use('L3MON4D3/LuaSnip')

  -- Formatting
  use('mhartington/formatter.nvim')

  -- UI Stuff
  use('nvim-telescope/telescope.nvim')
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use('stevearc/dressing.nvim')
  use('nvim-neo-tree/neo-tree.nvim')
  use('noib3/nvim-cokeline')
  use('rcarriga/nvim-notify')

  -- Statusline
  use('nvim-lualine/lualine.nvim')

  -- Git
  use('lewis6991/gitsigns.nvim')

  -- Sessions
  use('Shatur/neovim-session-manager')

  -- Util
  use('folke/todo-comments.nvim')
  use('numToStr/Comment.nvim')
  use('ggandor/leap.nvim')
  use('beauwilliams/focus.nvim')
  use('famiu/bufdelete.nvim')
  use('numToStr/FTerm.nvim')
  use('sindrets/winshift.nvim')
  use('https://gitlab.com/yorickpeterse/nvim-pqf')
  use('gbprod/cutlass.nvim')
  use('kylechui/nvim-surround')
  use({ 'nullishamy/autosave.nvim', branch = 'dev' })
  use('karb94/neoscroll.nvim')

  -- Misc
  use('nathom/filetype.nvim')
  use('andweeb/presence.nvim')

  use('kyazdani42/nvim-web-devicons') -- must be loaded last

  if packer_bootstrap then -- Sync when bootstrapped
    require('packer').sync()
  end
end)
