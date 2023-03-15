local status, cmp = pcall(require, 'cmp')
if not status then
  return
end

local status_lspkind, lspkind = pcall(require, 'lspkind')
if not status_lspkind then
  return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end

local cmp_tabnine_status_ok, tabnine = pcall(require, "cmp_tabnine.config")
if not cmp_tabnine_status_ok then
  return
end

local buffer_option = {
  -- Complete from all visible buffers (splits)
  get_bufnrs = function()
    local bufs = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      bufs[vim.api.nvim_win_get_buf(win)] = true
    end
    return vim.tbl_keys(bufs)
  end
}

-- require('luasnip.loaders.from_vscode').load { paths = './snippets' }
require('luasnip.loaders.from_vscode').lazy_load()

local check_backspace = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif check_backspace() then
        -- cmp.complete()
        fallback()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp', priority = 900 },
    { name = 'luasnip', priority = 850, max_item_count = 8 },
    { name = 'cmp_tabnine', priority = 800, max_num_results = 3 },
    -- { name = 'npm', priority = 7 },
    { name = 'buffer', priority = 700, keyword_length = 5, option = buffer_option, max_item_count = 8 },
    { name = 'nvim_lua', priority = 600 },
    { name = 'path', priority = 500 },
    { name = 'emoji', priority = 400 },
  },
  formatting = {
    format = lspkind.cmp_format { with_text = false, maxwidth = 50 },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    -- documentation = false,
    documentation = {
      border = 'rounded',
      winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
    },
    completion = {
      border = 'rounded',
      winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
    },
  },
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Cmdline Setup                                            │
-- ╰──────────────────────────────────────────────────────────╯

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- ╭──────────────────────────────────────────────────────────╮
-- │ Tabnine Setup                                            │
-- ╰──────────────────────────────────────────────────────────╯
tabnine:setup({
  max_lines                = 1000;
  max_num_results          = 3;
  sort                     = true;
  show_prediction_strength = true;
  run_on_every_keystroke   = true;
  snipper_placeholder      = '..';
  ignored_file_types       = {};
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
