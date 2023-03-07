local utils = require('diag.lsp.utils')

local servers = require('diag.lsp.servers')

local generate_on_attach = function()
    return function(client, buf)
        utils.common_on_attach(client, buf)
    end
end

local on_init = function(config)
    return function(server, res)
        config.on_init(config)
    end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp = require('lspconfig')

for server, config in pairs(servers) do
    config.autostart = true
    config.capabilities = capabilities
    config.on_attach = generate_on_attach()

    if config.on_init then
        config.on_init = on_init(config)
    end

    if config.external_setup then
        config.external_setup(config)
    else
        lsp[server].setup(config)
    end
end

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    severity_sort = true,
})

utils.setup_lsp_borders()
