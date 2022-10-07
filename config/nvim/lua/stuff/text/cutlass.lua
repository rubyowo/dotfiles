require('cutlass').setup({
  cut_key = 'x',
  override_del = nil,
  -- Exclude keys that leap.nvim uses
  exclude = { 'ns', 'nS' },
})
