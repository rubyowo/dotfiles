require('formatter').setup({
  filetype = {
    lua = require('formatter.filetypes.lua').stylua,
    typescript = require('formatter.filetypes.typescript').prettierd,
    rust = require('formatter.filetypes.rust').rustfmt,
    python = require('formatter.filetypes.python').black,
    nix = require('formatter.filetypes.nix').alejandra
  },
})
