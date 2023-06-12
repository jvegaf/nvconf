return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").load { paths = { "./my_snippets" } }
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    opts = function()
      local source_mapping = {
        npm = "  " .. "NPM",
        Codeium = "  ",
        nvim_lsp = "  " .. "LSP",
        buffer = " ﬘ " .. "BUF",
        nvim_lua = "  ",
        emoji = "  ",
        luasnip = "  " .. "SNP",
        path = " ﱮ ",
        treesitter = "  ",
        zsh = "  " .. "ZSH",
      }

      local cmp = require "cmp"
      local lspkind = require "lspkind"

      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match "^%s*$" == nil
      end

      return {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-n>"]     = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-p>"]     = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
          ["<C-f>"]     = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<CR>"]      = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"]    = cmp.mapping.confirm {
            behavior    = cmp.ConfirmBehavior.Replace,
            select      = true,
          }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<Tab>"]     = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp", group_index = 2 },
          { name = "nvim_lua", group_index = 2 },
          { name = "luasnip",  group_index = 2 },
          { name = "emoji",    group_index = 2 },
          { name = "buffer",   group_index = 2 },
          { name = "path",     group_index = 2 },
        },
        formatting = {
          format = lspkind.cmp_format {
            mode = "symbol_text",
            max_width = 50,
            symbol_map = source_mapping,
            before = function(entry, vim_item)
              vim_item.kind = lspkind.symbolic(vim_item.kind, { with_text = true })
              local menu = source_mapping[entry.source.name]
              local maxwidth = 50

              vim_item.menu = menu
              vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
              return vim_item
            end,
          },
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        experimental = {
          ghost_text = true,
        },
        window = {
          documentation = {
            border = "rounded",
            winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
          },
          completion = {
            border = "rounded",
            winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
          },
        },
      }
    end,
  },
}
