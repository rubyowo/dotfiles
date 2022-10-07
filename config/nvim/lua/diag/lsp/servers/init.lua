local servers = {
  tsserver = {},
  bashls = {},
  dockerls = {},
  rust_analyzer = require('diag.lsp.servers.rust_analyzer'),
  pyright = {},
  sumneko_lua = require('diag.lsp.servers.sumneko_lua'),
  zeppelin_language_server = require('diag.lsp.servers.zeppelin_language_server'),
  null_ls = require('diag.lsp.servers.null_ls'),
}

return servers
