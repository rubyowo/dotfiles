local ok, utils = pcall(require, 'utils')
if not ok then
  return vim.notify_once('Failed to load `utils` module, cannot proceed.')
end

local load = utils.load_module

-- Preload plugins
load('core/plugins')

-- Editor Core
load('core/editor')
load('core/keybinds')
load('core/autocmds')

-- Theme
load('theme')

-- Diagnostics
load('diag/mason')
load('diag/lsp/servers/custom') -- Load custom lsps
load('diag/lsp')
load('diag/lspsigns')
load('diag/cmp')
load('diag/lspdiags')
load('diag/format')

-- Treesitter
load('treesitter')

-- Plugin Confs
load('stuff/filetype')
load('stuff/gittree')
load('stuff/presence')
load('stuff/autosave')
-- load('stuff/neorg')

-- Vim Navigation
load('stuff/nav/leap')
load('stuff/nav/focus')
load('stuff/nav/scroll')

-- UI
load('stuff/ui/pqf')
load('stuff/ui/dressing')
load('stuff/ui/telescope')
load('stuff/ui/terminal')
load('stuff/ui/notify')
load('stuff/ui/tree')
load('stuff/ui/statusline')
load('stuff/ui/bufferline')

-- Text stuff
load('stuff/text/todo-comments')
load('stuff/text/autopairs')
load('stuff/text/comment')
load('stuff/text/cutlass')
load('stuff/text/icons')
load('stuff/text/surround')
