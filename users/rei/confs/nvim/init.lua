local ok, utils = pcall(require, 'utils')
if not ok then
    return vim.notify_once('Failed to load `utils` module, cannot proceed.')
end

local load = utils.load_module

-- Preload plugins
load('core/plugins')

-- Theme
load('theme')

-- Editor Core
load('core/editor')
load('core/keybinds')
load('core/autocmds')

-- Diagnostics
load('diag/lsp/servers/custom') -- Load custom lsps
load('diag/lsp')
load('diag/lspsigns')

-- UI
load('stuff/ui/lazygit')
load('stuff/ui/statusline')
load('stuff/ui/bufferline')
