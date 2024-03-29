return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-context",
      "RRethy/nvim-treesitter-textsubjects",
      {
        "m-demare/hlargs.nvim",
        config = function()
          require("hlargs").setup { color = "#F7768E" }
        end,
      },
    },
    opts = {
      ensure_installed = { "lua", "vim", "javascript", "typescript", "tsx", "cpp" },
      auto_install = true,
      ignore_install = { "haskell" }, -- list of parsers to ignore installing
      autotag = {
        enable = true,
      },
      highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = false,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>gnn",
          node_incremental = "<leader>gnr",
          scope_incremental = "<leader>gne",
          node_decremental = "<leader>gnt",
        },
      },

      refactor = {
        -- highlight_current_scope = { enable = true },
        highlight_definitions = {
          enable = true,
          -- Set to false if you have an `updatetime` of ~100.
          clear_on_cursor_move = true,
        },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "grr",
          },
        },
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gnd",
            list_definitions = "gnD",
            list_definitions_toc = "gO",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
          },
        },
      },

      indent = {
        enable = true,
      },

      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },

      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]]"] = "@function.outer",
            ["]m"] = "@class.outer",
          },
          goto_next_end = {
            ["]["] = "@function.outer",
            ["]M"] = "@class.outer",
          },
          goto_previous_start = {
            ["[["] = "@function.outer",
            ["[m"] = "@class.outer",
          },
          goto_previous_end = {
            ["[]"] = "@function.outer",
            ["[M"] = "@class.outer",
          },
        },
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["~"] = "@parameter.inner",
          },
        },
      },

      textsubjects = {
        enable = true,
        keymaps = {
          ["<cr>"] = "textsubjects-smart", -- works in visual mode
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
      parser_config.json.filetype_to_parsername = { "json", "vil" }
    end,
}
