require('mason').setup({
  ui = {
    border = 'rounded',
  },
})
require('mason-tool-installer').setup({
  ensure_installed = {
    -- Formatters
    'stylua',
    'prettierd',
    'black',

    -- Linters
    'selene',
    'eslint-lsp',

    -- LSPs
    'lua-language-server',
    'typescript-language-server',
    'bash-language-server',
    'dockerfile-language-server',
    'pyright',
    'rust-analyzer',
    'deno'
  },
  run_on_start = true,
})
