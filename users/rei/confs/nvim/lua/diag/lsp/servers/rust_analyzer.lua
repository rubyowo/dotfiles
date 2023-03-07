return {
    external_setup = function(config)
        require('rust-tools').setup({
            server = {
                autostart = true,
                on_attach = config.on_attach,
                capabilities = config.capabilities,
                cmd = { 'rust-analyzer' },
            },
            tools = {
                autoSetHints = false,
                inlay_hints = {
                    show_parameter_hints = false,
                    show_variable_name = false,
                    on_initialized = function()
                        require('rust-tools.inlay_hints').disable_inlay_hints()
                    end,
                },
            },
        })
    end,
}
