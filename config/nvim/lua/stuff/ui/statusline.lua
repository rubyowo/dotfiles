local colors = require('catppuccin.palettes').get_palette()

local config = {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    disabled_filetypes = { 'neo-tree' },
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
    globalstatus = true,
  },
  sections = {
    -- Remove defaults
    lualine_a = { 'mode' },
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},

    -- Insert ourselves
    lualine_c = {},
    lualine_x = {},
  },
}

local conditions = {
  buf_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  ft_not_empty = function()
    return vim.fn.empty(vim.bo.filetype) ~= 1
  end,
}

local function ins_left(comp)
  table.insert(config.sections.lualine_c, comp)
end

local function ins_right(comp)
  table.insert(config.sections.lualine_x, comp)
end

local function color(c)
  return { fg = c, gui = 'bold' }
end

ins_left({
  'filename',
  fmt = function(f)
    return f or '[No name]'
  end,
  icon = '',
  color = color(colors.blue),
})

ins_left({ 'filetype', icons_enabled = true, cond = conditions.ft_not_empty, color = color(colors.sky) })

ins_right({
  function()
    local msg = 'None'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= 1 then
        return client.name
      end
    end
    return msg
  end,
  cond = conditions.buf_not_empty,
  color = color(colors.teal),
})

ins_right({
  'location',
  fmt = function(l)
    return string.gsub(l, ' ', '')
  end,
  icon = '',
  color = color(colors.flamingo),
})

ins_right({ 'branch', icon = '', color = color(colors.red) })

ins_right({
  'diff',
  symbols = { added = '', modified = '柳', removed = '' },
  diff_color = {
    added = color(colors.green),
    modified = color(colors.yellow),
    removed = color(colors.red),
  },
})

require('lualine').setup(config)
