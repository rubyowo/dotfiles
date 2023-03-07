return {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    n = {
      ['q'] = function(...)
        return require('telescope.actions').close(...)
      end,
    },
  },
  extensions = {},
}
