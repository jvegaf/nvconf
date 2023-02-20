return {

  -- Themes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd [[colorscheme tokyonight]]
      require "config.colorscheme"
    end,
  },
  -- {
  --   "tanvirtin/monokai.nvim",
  --   lazy = false,
  --   config = true,
  -- },
  { "RRethy/nvim-base16", lazy = true },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = {
      code_style = {
        comments = "italic",
        keywords = "italic",
        functions = "none",
        strings = "none",
        variables = "none",
      },
    },
  },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require "plugins.alpha"
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
      require "plugins.treesitter"
    end,
    dependencies = {
      "mrjones2014/nvim-ts-rainbow",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
      {
        "m-demare/hlargs.nvim",
        config = function()
          require("hlargs").setup { color = "#F7768E" }
        end,
      },
    },
  },

  {
    "bennypowers/nvim-regexplainer",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
      { "MunifTanjim/nui.nvim" },
    },
    opts = {
      auto = true,
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = {
      "mason.nvim",
    },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "vim-language-server",
        "stylua",
        "luacheck",
        "misspell",
        "shellcheck",
        "shfmt",
        "xmlformatter",
        "stylelint",
        "yamllint",
        "prettier",
        "eslint_d",
      },
      run_on_start = false,
    },
  },
  -- Navigating (Telescope/Tree/Refactor)

  {
    "RRethy/vim-illuminate",
  },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      -- you'll need at least one of these
      { "nvim-telescope/telescope.nvim" },
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require("neoclip").setup()
      require("telescope").load_extension "neoclip"
    end,
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      ---@diagnostic disable-next-line: different-requires
      require "plugins.telescope"
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "stevearc/aerial.nvim", config = true },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "cljoly/telescope-repo.nvim" },
      { "nvim-telescope/telescope-symbols.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "nvim-telescope/telescope-node-modules.nvim" },
      { "nvim-telescope/telescope-hop.nvim" },
      { "gbrlsnchs/telescope-lsp-handlers.nvim" },
      { "xiyaowong/telescope-emoji.nvim" },
      { "LinArcX/telescope-changes.nvim" },
      { "FeiyouG/command_center.nvim" },
      { "debugloop/telescope-undo.nvim" },
      { "danielvolchek/tailiscope.nvim" },
      { "gbprod/yanky.nvim", config = true },
    },
  },
  {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = true,
    cmd = { "Cheatsheet", "CheatsheetEdit" },
  },
  { "nvim-pack/nvim-spectre" },
  -- file browser
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
      require "plugins.tree"
    end,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    -- event = "User DirOpened",
  },
  {
    "gbprod/stay-in-place.nvim",
    lazy = true,
    config = true, -- run require("stay-in-place").setup()
  },
  {
    "phaazon/hop.nvim",
    lazy = false,
    branch = "v2",
    config = function()
      require "plugins.hop"
    end,
  },
  {
    "tiagovla/scope.nvim",
    event = "BufRead",
    config = true,
  },
  {
    "moll/vim-bbye",
    lazy = true,
    cmd = { "Bdelete" },
  },
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
      options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "none",
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        -- name_formatter = function(buf)  -- buf contains:
        -- name                | str        | the basename of the active file
        -- path                | str        | the full path of the active file
        -- bufnr (buffer only) | int        | the number of the active buffer
        -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
        -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
        -- end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return "(" .. count .. ")"
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number, buf_numbers)
          -- filter out filetypes you don't want to see
          if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
            return true
          end
          -- filter out by buffer name
          if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
            return true
          end
          -- filter out based on arbitrary rules
          -- e.g. filter out vim wiki buffer from tabline in your work repo
          if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
            return true
          end
          -- filter out by it's index number in list (don't show first buffer)
          if buf_numbers[1] ~= buf_number then
            return true
          end
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "",
            text_align = "left",
            separator = true,
          },
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "slant",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        sort_by = "insert_after_current",
      },
    },
  },
  -- LSP Base
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    servers = nil,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  },

  -- Formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    config = function()
      require "plugins.null-ls"
    end,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    dependencies = { "nvim-lspconfig" },
  },
  {
    "ErichDonGubler/lsp_lines.nvim",
    config = true,
    dependencies = { "nvim-lspconfig" },
  },

  -- LSP Cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
      { "tzachar/cmp-tabnine", build = "./install.sh" },
      {
        "David-Kunz/cmp-npm",
        config = function()
          require "plugins.cmp-npm"
        end,
      },
      { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
    },
    config = function()
      require "plugins.cmp"
    end,
  },

  -- LSP Addons
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require "plugins.dressing"
    end,
  },
  { "onsails/lspkind-nvim" },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require "plugins.trouble"
    end,
  },
  { "nvim-lua/popup.nvim" },
  {
    "ChristianChiarulli/nvim-gps",
    branch = "text_hl",
    config = function()
      require "plugins.gps"
    end,
  },
  { "jose-elias-alvarez/typescript.nvim" },
  {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    config = true, -- run require("template-string").setup()
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "main", -- or "anticonceal"
    config = function()
      require "plugins.inlay-hints"
    end,
  },

  -- General
  { "AndrewRadev/switch.vim", lazy = true },
  { "AndrewRadev/splitjoin.vim", lazy = true },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    branch = "jsx",
    config = function()
      require "plugins.comment"
    end,
  },
  { "LudoPinelli/comment-box.nvim" },
  {
    "akinsho/nvim-toggleterm.lua",
    lazy = true,
    branch = "main",
    config = function()
      require "plugins.toggleterm"
    end,
  },
  { "dhruvasagar/vim-table-mode", ft = { "markdown" } },
  {
    "mg979/vim-visual-multi",
    keys = {
      "<C-n>",
      "<C-Up>",
      "<C-Down>",
      "<S-Up>",
      "<S-Down>",
      "<S-Left>",
      "<S-Right>",
    },
    config = function()
      vim.g.VM_leader = ";"
    end,
  },
  {
    "voldikss/vim-browser-search",
    keys = { { "<A-s>", ":'<,'>BrowserSearch<cr>", mode = "v", desc = "Search on web" } },
  },
  {
    "nacro90/numb.nvim",
    lazy = false,
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    event = "BufEnter",
    config = function()
      require "plugins.todo-comments"
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    config = function()
      require "plugins.lightspeed"
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function()
      require "plugins.whichkey"
    end,
  },
  {
    "ecosse3/galaxyline.nvim",
    config = function()
      require "plugins.galaxyline"
    end,
    event = "VeryLazy",
  },
  -- {
  --   "romgrk/barbar.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   event = "BufAdd",
  --   config = function()
  --     require "plugins.barbar"
  --   end,
  -- },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        background_colour = "#000000",
      }
    end,
    init = function()
      local banned_messages =
        { "No information available", "LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+." }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        require "notify"(msg, ...)
      end
    end,
  },
  {
    "vuki656/package-info.nvim",
    event = "BufEnter package.json",
    config = function()
      require "plugins.package-info"
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "declancm/cinnamon.nvim",
    config = function()
      require "plugins.cinnamon"
    end,
  },
  {
    "Shatur/neovim-session-manager",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    config = function()
      require "plugins.session-manager"
    end,
  },
  { "kylechui/nvim-surround", lazy = false, config = true },
  {
    "sunjon/shade.nvim",
    config = function()
      require("shade").setup()
      require("shade").toggle()
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    end,
  },
  {
    "Vonr/align.nvim",
    config = function()
      local NS = { noremap = true, silent = true }

      vim.keymap.set("x", "gaa", function()
        require("align").align_to_char(1, true)
      end, NS) -- Aligns to 1 character, looking left
      vim.keymap.set("x", "gas", function()
        require("align").align_to_char(2, true, true)
      end, NS) -- Aligns to 2 characters, looking left and with previews
      vim.keymap.set("x", "gaw", function()
        require("align").align_to_string(false, true, true)
      end, NS) -- Aligns to a string, looking left and with previews
      vim.keymap.set("x", "gar", function()
        require("align").align_to_string(true, true, true)
      end, NS) -- Aligns to a Lua pattern, looking left and with previews

      -- Example gawip to align a paragraph to a string, looking left and with previews
      vim.keymap.set("n", "gaw", function()
        local a = require "align"
        a.operator(a.align_to_string, { is_pattern = false, reverse = true, preview = true })
      end, NS)

      -- Example gaaip to aling a paragraph to 1 character, looking left
      vim.keymap.set("n", "gaa", function()
        local a = require "align"
        a.operator(a.align_to_char, { length = 1, reverse = true })
      end, NS)
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require "plugins.indent"
    end,
  },
  {
    "lalitmee/browse.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  { "normen/vim-pio" },
  -- Snippets & Language & Syntax
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "plugins.autopairs"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "plugins.colorizer"
    end,
  },
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "plugins.git.signs"
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    config = function()
      require "plugins.git.diffview"
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require "plugins.git.conflict"
    end,
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    keys = {
      "<Leader>gwc",
      "<Leader>gww",
    },
    config = function()
      require "plugins.git.worktree"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitCurrentFile", "LazyGitFilterCurrentFile", "LazyGitFilter" },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  },

  -- Testing
  {
    "rcarriga/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require "plugins.neotest"
    end,
  },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "plugins.dap"
    end,
    keys = {
      "<Leader>da",
      "<Leader>db",
      "<Leader>dc",
      "<Leader>dd",
      "<Leader>dh",
      "<Leader>di",
      "<Leader>do",
      "<Leader>dO",
      "<Leader>dt",
    },
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
    },
  },
}
