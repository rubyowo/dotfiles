local utils = require('utils')
local map = utils.map

map('', 'q:', '<Nop>') -- Disabled since annoying

--Remap space as leader key
map('', '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable arrow keys to force hjkl usage
map('n', '<Up>', '<Nop>')
map('n', '<Down>', '<Nop>')
map('n', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')

-- Buffer controls
map('', '<Leader>q', '<cmd>Bdelete<cr>')
map('n', '<Leader>x', ':x<cr>')
map('n', '<Leader>w', ':w<cr>')
map('', '<C-q>', ':qa!<cr>')

-- Telescope & tree
map('n', '<Leader>f', '<cmd>Telescope find_files<cr>')
map('n', '<C-b>', '<cmd>Telescope buffers<cr>')
map('n', '<F1>', '<cmd>Telescope help_tags<cr>')
map('n', '<Leader>g', '<cmd>Telescope live_grep<cr>')
map('n', '<Leader>h', '<cmd>Neotree focus reveal<cr>')

-- Bufferline
map('n', ']p', '<Plug>(cokeline-focus-next)')
map('n', '[p', '<Plug>(cokeline-focus-prev)')

-- Jump to start / end
map('', 'H', '^')
map('', 'L', 'g_')

-- Move lines up and down
map('n', '<C-J>', '<cmd>m -2<cr>')
map('n', '<C-K>', '<cmd>m +1<cr>')

-- j and k with Text Wrapping enabled
map('n', 'j', 'gj', {silent = true})
map('n', 'k', 'gk', {silent = true})

-- Terminal
map('n', '<Leader>`', '<cmd>lua require("FTerm").toggle()<cr>')
map('t', '<Leader>`', '<C-\\><C-n><cmd>lua require("FTerm").toggle()<cr>')
map('t', '<S-Esc>', '<C-\\><C-n>')

-- Trouble
map('n', '<Leader>t', '<cmd>Trouble workspace_diagnostics<cr>')

-- Sessions
map('n', '<Leader>sl', '<cmd>SessionManager load_session<cr>')
map('n', '<Leader>sd', '<cmd>SessionManager delete_session<cr>')
map('n', '<Leader>ss', '<cmd>SessionManager save_current_session<cr>')

-- Focus
map('n', '<A-h>', '<cmd>FocusSplitLeft<cr>')
map('n', '<A-j>', '<cmd>FocusSplitDown<cr>')
map('n', '<A-k>', '<cmd>FocusSplitUp<cr>')
map('n', '<A-l>', '<cmd>FocusSplitRight<cr>')

-- Formatting
map('n', '<A-f>', '<cmd>FormatWrite<cr>')
