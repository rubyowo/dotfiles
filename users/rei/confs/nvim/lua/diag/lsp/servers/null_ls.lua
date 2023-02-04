return {
  external_setup = function()
    local null_ls = require('null-ls').builtins

    require('null-ls').setup({
      update_in_insert = true,
      sources = {
        -- Formatters
        null_ls.formatting.stylua,
        null_ls.formatting.prettier,

        -- Linters
        null_ls.diagnostics.eslint_d,
        null_ls.diagnostics.selene,
      },
    })
  end,
}
