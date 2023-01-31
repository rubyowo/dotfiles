vim.g.catppuccin_flavour = 'mocha'
local colors = require('catppuccin.palettes').get_palette()

require('catppuccin').setup({
  integrations = {
    treesitter = true,
    treesitter_context = true,
    ts_rainbow = true,
    cmp = true,
    gitsigns = true,
    leap = true,
    telescope = true,
    neotree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    markdown = true,
    notify = true,
  },
  compile = {
    enabled = true,
    path = vim.fn.stdpath('cache') .. '/catppuccin',
  },
  custom_highlights = {
    FloatBorder = { fg = colors.pink },
  },
})

vim.api.nvim_command "colorscheme catppuccin"
