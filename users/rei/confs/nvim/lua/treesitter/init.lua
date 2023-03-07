return {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
  ensure_installed = require('treesitter.ensure_installed'),
  textobjects = require('treesitter.textobjects'),
  incremental_selection = require('treesitter.incremental_selection'),
}
