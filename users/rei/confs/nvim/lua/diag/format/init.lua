require('formatter').setup({
  filetype = {
    lua = require('formatter.filetypes.lua').stylua,
    typescript = require('formatter.filetypes.typescript').prettier,
    typescriptreact = require('formatter.filetypes.typescriptreact').prettier,
    javascript = require('formatter.filetypes.javascript').prettier,
    rust = require('formatter.filetypes.rust').rustfmt,
    python = require('formatter.filetypes.python').black,
    nix = require('formatter.filetypes.nix').alejandra,
  },
})
