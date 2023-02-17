local servers = {
  tsserver = require('diag.lsp.servers.tsserver'),
  denols = require('diag.lsp.servers.denols'),
  bashls = {},
  dockerls = {},
  rust_analyzer = require('diag.lsp.servers.rust_analyzer'),
  pyright = {},
  lua_ls = require('diag.lsp.servers.lua_ls'),
  null_ls = require('diag.lsp.servers.null_ls'),
  rnix = {},
}

return servers
