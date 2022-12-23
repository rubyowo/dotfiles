local LAZY_GIT_CONFIG_KEY = 'CONFIG_DIR'
local LAZY_GIT_BINARY = 'lazygit'

require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_formatter = function(name, blame_info, opts)
    if blame_info.author == name then
      blame_info.author = 'You'
    end
    local text
    if blame_info.author == 'Not Committed Yet' then
      text = blame_info.author
    else
      local date_time
      if opts.relative_time then
        date_time = require('gitsigns.util').get_relative_time(tonumber(blame_info['author_time']))
      else
        date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))
      end
      text = string.format('%s, %s (%s)', blame_info.author, date_time, blame_info.summary)
    end
    return { { ' ' .. text, 'GitSignsCurrentLineBlame' } }
  end,
  current_line_blame_formatter_nc = 'You (Uncommitted changes)',
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
})

local fterm = require('FTerm')

local lazygit = fterm:new({
  ft = 'fterm_lazygit',
  border = 'rounded',
  cmd = function()
    local Path = require('plenary.path')
    local config_path = Path:new(vim.env.MYVIMRC):parent()
    local lazygit_path = config_path:joinpath('lua', 'stuff', 'lazygit')

    return string.format('%s=%s %s', LAZY_GIT_CONFIG_KEY, lazygit_path:absolute(), LAZY_GIT_BINARY)
  end,
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

-- Use this to toggle gitui in a floating terminal
vim.keymap.set('n', '<C-g>', function()
  lazygit:toggle()
end)

vim.keymap.set('t', '<C-g>', function()
  lazygit:toggle()
end)
