local M = {}

function M.load_module(mod)
  local ok, res = pcall(require, mod)

  if not ok then
    vim.notify_once(string.format('Failed to load module %s | %s', mod, res))
  end
end

function M.map(mode, bind, thing, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, bind, thing, options)
end

function M.border(hl_name)
  return {
    { '╭', hl_name },
    { '─', hl_name },
    { '╮', hl_name },
    { '│', hl_name },
    { '╯', hl_name },
    { '─', hl_name },
    { '╰', hl_name },
    { '│', hl_name },
  }
end

return M
