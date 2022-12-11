local utils = require('diag.lsp.utils')

local servers = require('diag.lsp.servers')

local generate_on_attach = function()
  return function(client, buf)
    utils.common_on_attach(client, buf)
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp = require('lspconfig')

for server, config in pairs(servers) do
  config.autostart = true
  config.capabilities = capabilities
  config.on_attach = generate_on_attach()

  if config.external_setup then
    config.external_setup(config)
  else
    lsp[server].setup(config)
  end

  if config.post_init then
    config.post_init(config)
  end
end

utils.setup_lsp_borders()
