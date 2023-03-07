return {
    external_setup = function()
        local null_ls = require('null-ls').builtins

        require('null-ls').setup({
            update_in_insert = true,
            sources = {
                -- Formatters
                null_ls.formatting.stylua,
                null_ls.formatting.prettier,
                null_ls.formatting.alejandra,
                null_ls.formatting.rustfmt,
                null_ls.formatting.black,

                -- Linters
                null_ls.diagnostics.eslint_d,
                null_ls.diagnostics.selene,
                null_ls.diagnostics.statix,

                -- Code Actions
                null_ls.code_actions.statix,
            },
        })
    end,
}
