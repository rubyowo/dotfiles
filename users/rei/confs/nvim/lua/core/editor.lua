local g = vim.g
local wo = vim.wo
local opt = vim.opt
local o = vim.o

opt.completeopt = 'menu,noinsert,noselect,preview'
opt.showmode = false
opt.updatetime = 100
opt.mouse = 'a'
opt.termguicolors = true

wo.number = true
wo.relativenumber = true
g.wrap = true

opt.shiftwidth = 4
opt.expandtab = true
opt.tabstop = 4
g.sessionoptions = 'buffers,curdir,folds'

opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240

opt.shortmess = 'fxtToOIF'

o.cmdheight = 0

if vim.fn.has('clipboard') == 1 then
    vim.opt.clipboard:append('unnamedplus')
end
