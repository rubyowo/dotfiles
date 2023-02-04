local servers = {
  tsserver = require('diag.lsp.servers.tsserver'),
  denols = require('diag.lsp.servers.denols'),
  bashls = {},
  dockerls = {},
  rust_analyzer = require('diag.lsp.servers.rust_analyzer'),
  pyright = {},
  sumneko_lua = require('diag.lsp.servers.sumneko_lua'),
  null_ls = require('diag.lsp.servers.null_ls'),
  rnix = {},
}

return servers
