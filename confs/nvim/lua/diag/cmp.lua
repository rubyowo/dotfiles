local present, cmp = pcall(require, 'cmp')

if not present then
  return
end

local border = require('utils').border
local cmp_window = require('cmp.utils.window')

function cmp_window:has_scrollbar()
  return false
end

local icons = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = 'ﰠ',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = 'פּ',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

local options = {
  window = {
    completion = {
      border = border('FloatBorder'),
      winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
    },
    documentation = {
      border = border('FloatBorder'),
    },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)

      return vim_item
    end,
  },
  mapping = {
    ['<S-TAB>'] = cmp.mapping.select_prev_item(),
    ['<TAB>'] = cmp.mapping.select_next_item(),
    ['<ESC>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'neorg' },
    { name = 'spell' },
  },
}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

cmp.setup(options)

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = true,
  severity_sort = true,
})
