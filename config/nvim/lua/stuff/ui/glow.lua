local fterm = require('FTerm')

local glowwin = fterm:new({
  ft = 'fterm_glow',
  border = 'rounded',
  cmd = "glow",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})
