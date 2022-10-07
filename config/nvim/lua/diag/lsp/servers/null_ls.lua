return {
  external_setup = function()
    local null_ls = require('null-ls').builtins

    require('null-ls').setup({
      update_in_insert = true,
      sources = {
        -- Formatters
        null_ls.formatting.stylua,
        null_ls.formatting.prettierd,

        -- Linters
        null_ls.diagnostics.eslint,
        null_ls.diagnostics.selene,
        }
      })
    end
}
