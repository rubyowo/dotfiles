return {
  cmd = { 'rust-analyzer' },
  post_init = function(config)
    require('rust-tools').setup({
      server = {
        autostart = true,
        on_attach = config.on_attach,
        capabilities = config.capabilities,
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
