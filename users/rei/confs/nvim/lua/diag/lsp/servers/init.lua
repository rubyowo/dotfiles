local servers = {
  tsserver = {},
  denols = {},
  bashls = {},
  dockerls = {},
  rust_analyzer = require('diag.lsp.servers.rust_analyzer'),
  pyright = {},
  sumneko_lua = require('diag.lsp.servers.sumneko_lua'),
  null_ls = require('diag.lsp.servers.null_ls'),
  rnix = {},
}

return servers
