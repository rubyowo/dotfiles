local M = {}

function M.common_on_attach(_, buf)
  local opts = { noremap = true, silent = true }
  local map = vim.api.nvim_buf_set_keymap

  map(buf, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  map(buf, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  map(buf, 'n', '<C-Space>', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  map(buf, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  map(buf, 'i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  map(buf, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  map(buf, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  map(buf, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  map(buf, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  map(buf, '', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  map(buf, '', 'gn', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  map(buf, '', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
end

function M.setup_lsp_borders()
  local border = require('utils').border

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = border('FloatBorder'),
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = border('FloatBorder'),
  })
end

return M
