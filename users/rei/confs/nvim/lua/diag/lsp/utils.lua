local M = {}

function M.common_on_attach(client, buf)
    local opts = { noremap = true, silent = true, buffer = buf }
    local map = vim.keymap.set
    map('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
    map('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
    map('n', 'gI', '<cmd>Telescope lsp_implementations<cr>', opts)
    map('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', opts)
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', '<C-Space>', vim.lsp.buf.hover, opts)
    map('n', '<C-s>', vim.lsp.buf.signature_help, opts)
    map('n', '<leader>r', vim.lsp.buf.rename, opts)
    map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    map('n', 'gn', vim.diagnostic.goto_next, opts)
    map('n', 'gp', vim.diagnostic.goto_prev, opts)
    map('n', 'gl', vim.diagnostic.open_float, opts)
    map('n', 'gb', function()
        vim.diagnostic.open_float({ scope = 'b' })
    end, opts)

    -- client.server_capabilities.documentFormattingProvider = false
    map('n', '<A-f>', function()
        vim.lsp.buf.format({ async = true })
    end, opts)

    if client.name == 'tsserver' then
        map('n', '<leader>co', '<cmd>TypescriptOrganizeImports<CR>', opts)
        map('n', '<leader>cR', '<cmd>TypescriptRenameFile<CR>', opts)
    end
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
