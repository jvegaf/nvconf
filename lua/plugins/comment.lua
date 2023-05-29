return {
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    dependencies = { "lvimuser/lsp-inlayhints.nvim" },
    branch = "jsx",
    opts = {
      ---Add a space b/w comment and the line
      ---@type boolean
      padding = true,

      ---Lines to be ignored while comment/uncomment.
      ---Could be a regex string or a function that returns a regex string.
      ---Example: Use '^$' to ignore empty lines
      ---@type string|function
      ignore = nil,

      ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
      ---@type table
      mappings = {
        ---operator-pending mapping
        ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
        basic = true,
        ---extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = true,
        ---extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = false,
      },

      ---LHS of toggle mapping in NORMAL + VISUAL mode
      ---@type table
      toggler = {
        ---line-comment keymap
        line = "gcc",
        ---block-comment keymap
        block = "gbc",
      },

      ---LHS of operator-pending mapping in NORMAL + VISUAL mode
      ---@type table
      opleader = {
        ---line-comment keymap
        line = "gc",
        ---block-comment keymap
        block = "gb",
      },

      ---Pre-hook, called before commenting the line
      ---@type function|nil
      ---@param ctx Ctx
      -- pre_hook = function(ctx)
      --   return require('ts_context_commentstring.internal').calculate_commentstring()
      -- end,
      pre_hook = function(ctx)
        -- return require('Comment.jsx').calculate(ctx)
        local line_start = (ctx.srow or ctx.range.srow) - 1
        local line_end = ctx.erow or ctx.range.erow
        require("lsp-inlayhints.core").clear(0, line_start, line_end)
        -- or vim.api.nvim_buf_clear_namespace(0, -1, line_start, line_end)
      end,

      ---Post-hook, called after commenting is done
      ---@type function|nil
      post_hook = nil,
    },
  },
  { "LudoPinelli/comment-box.nvim" },
  {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    opts = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        },
        WARN = { alt = { "WARNING" } },
        PERF = { alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      },
      highlight = {
        before = "", -- "fg" or "bg" or empty
        -- keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
    },
    config = function(_, opts)
      require("todo-comments").setup(opts)
      vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next()
      end, { desc = "Next todo comment" })
      vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev()
      end, { desc = "Previous todo comment" })
    end,
  },
}
