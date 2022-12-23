local get_hex = function(hl, g)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(hl)), g)
end

local catppuccin = require('catppuccin.palettes').get_palette()

require('cokeline').setup({
  default_hl = {
    fg = function(buffer)
      return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'fg')
    end,
    bg = get_hex('ColorColumn', 'bg'),
  },
  components = {
    {
      text = ' ',
      bg = get_hex('Normal', 'bg'),
    },
    {
      text = '',
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('Normal', 'bg'),
    },
    {
      text = function(buffer)
        return buffer.devicon.icon
      end,
      fg = function(buffer)
        return buffer.devicon.color
      end,
    },
    {
      text = function(buffer)
        return buffer.filename
      end,
      style = 'bold',
    },
    {
      text = '',
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('Normal', 'bg'),
    },
  },
})
