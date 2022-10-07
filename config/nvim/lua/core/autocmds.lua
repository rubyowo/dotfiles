local cmd = vim.api.nvim_command

-- Don't auto comment new lines
cmd([[
  autocmd BufEnter * set fo-=c fo-=r fo-=o
]])

-- Disable annoying autoindent rules
cmd([[
 autocmd BufEnter,WinEnter,FocusGained * set nocin nosi inde=
]])

-- Disable highlight searching for every buffer
cmd([[
 autocmd BufEnter,WinEnter,FocusGained * set nohlsearch
]])
