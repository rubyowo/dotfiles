local fterm = require('FTerm')

local lazygit = fterm:new({
  ft = 'fterm_lazygit',
  border = 'rounded',
  cmd = "lazygit",
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
