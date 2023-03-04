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
  { "RRethy/nvim-base16",   lazy = false },
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
      require "plugins.dashboard"
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
      "HiPhish/nvim-ts-rainbow2",
      "windwp/nvim-ts-autotag",
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
  { "Badhi/nvim-treesitter-cpp-tools", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  -- Navigating (Telescope/Tree/Refactor)
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require "plugins.telescope"
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "stevearc/aerial.nvim",                      config = true },
      { "nvim-telescope/telescope-fzf-native.nvim",  build = "make" },
      { "cljoly/telescope-repo.nvim" },
      { "nvim-telescope/telescope-symbols.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "nvim-telescope/telescope-node-modules.nvim" },
      { "gbrlsnchs/telescope-lsp-handlers.nvim" },
      { "xiyaowong/telescope-emoji.nvim" },
      { "LinArcX/telescope-changes.nvim" },
      { "FeiyouG/command_center.nvim" },
      { "debugloop/telescope-undo.nvim" },
      { "danielvolchek/tailiscope.nvim" },
      { "gbprod/yanky.nvim",                         config = true },
    },
  },
  { "nvim-pack/nvim-spectre" },
  {
    "nvim-tree/nvim-tree.lua",
    keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTreeToggle" } },
    config = function()
      require "plugins.tree"
    end,
  },
  {
    "gbprod/stay-in-place.nvim",
    lazy = false,
    config = true, -- run require("stay-in-place").setup()
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
    lazy = false,
    servers = nil,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = "Mason",
    keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = {
      "mason.nvim",
    },
    config = function()
      require"plugins.mason-installer"
    end
  },

  -- Formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    config = function()
      local null_ls = require "null-ls"
      null_ls.setup {
        sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.xmlformat,
    null_ls.builtins.formatting.prettier,

    null_ls.builtins.diagnostics.eslint_d.with {
      diagnostics_format = "[eslint] #{m}\n(#{c})",
    },
    -- b.diagnostics.php,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.diagnostics.yamllint,
    -- null_ls.builtins.diagnostics.luacheck,
        },
      }
    end,
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
      "hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
      { "tzachar/cmp-tabnine", build = "./install.sh" },
      {
        "David-Kunz/cmp-npm",
        config = function()
          require("cmp-npm").setup {
            ignore = {},
            only_semantic_versions = true,
          }
        end,
      },
      { "L3MON4D3/LuaSnip",    dependencies = "rafamadriz/friendly-snippets" },
      {
        "zbirenbaum/copilot-cmp",
        disable = not EcoVim.plugins.copilot.enabled,
        config = function()
          require("copilot_cmp").setup()
        end,
      },
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
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    lazy = false,
  },
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

  { "AndrewRadev/switch.vim",            lazy = false },
  --splitjoin
  {
    "bennypowers/splitjoin.nvim",
    lazy = true,
    keys = {
      {
        "gj",
        function()
          require("splitjoin").join()
        end,
        desc = "Join the object under cursor",
      },
      {
        "g,",
        function()
          require("splitjoin").split()
        end,
        desc = "Split the object under cursor",
      },
    },
  },
  -- browse
  {
    "voldikss/vim-browser-search",
    lazy = false,
    keys = { { "<A-s>", ":'<,'>BrowserSearch<cr>", mode = "v", desc = "Search on web" } },
  },
  {
    "lalitmee/browse.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    -- i = { "<cmd>BrowseInputSearch<cr>", "Input Search" },
    -- b = { "<cmd>Browse<cr>", "Browse" },
    -- d = { "<cmd>BrowseDevdocsSearch<cr>", "Devdocs" },
    -- f = { "<cmd>BrowseDevdocsFiletypeSearch<cr>", "Devdocs Filetype" },
    -- m = { "<cmd>BrowseMdnSearch<cr>", "Mdn" },
  },
  -- cheat
  {
    "RishabhRD/nvim-cheat.sh",
    dependencies = {
      "RishabhRD/popfix",
    },
    keys = {
      { "<leader>cs", "<cmd>Cheat<cr>", desc = "Cheat.sh" },
    },
  },
  -- platformio
  {
    "normen/vim-pio",
    event = "BufEnter platformio.ini",
  },
  -- comment
  {
    "numToStr/Comment.nvim",
    lazy = false,
    branch = "jsx",
    config = function()
      require "plugins.comment"
    end,
  },
  { "LudoPinelli/comment-box.nvim" },
  {
    "akinsho/nvim-toggleterm.lua",
    lazy = false,
    branch = "main",
    config = function()
      require "plugins.toggleterm"
    end,
    keys = {
      { "<A-1>", "<Cmd>1ToggleTerm direction=vertical<Cr>",   desc = "Terminal #1", mode = { "t", "n" } },
      { "<A-2>", "<Cmd>2ToggleTerm<Cr>",                      desc = "Terminal #2", mode = { "t", "n" } },
      { "<A-3>", "<Cmd>3ToggleTerm direction=horizontal<Cr>", desc = "Terminal #3", mode = { "t", "n" } },
    },
  },
  { "tpope/vim-repeat",            lazy = false },
  { "dhruvasagar/vim-table-mode",  ft = { "markdown" } },
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
    "nacro90/numb.nvim",
    lazy = false,
    config = function()
      require("numb").setup()
    end,
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
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require "plugins.bufferline"
    end,
  },
  -- { "antoinemadec/FixCursorHold.nvim" }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
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
        require "notify" (msg, ...)
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
    "p00f/clangd_extensions.nvim",
    lazy = true,
    ft = { "cpp" },
    config = function()
      require("clangd_extensions").setup()
    end,
  },
  {
    "declancm/cinnamon.nvim",
    config = function()
      require "plugins.cinnamon"
    end,
  },
  {
    "airblade/vim-rooter",
    setup = function()
      vim.g.rooter_patterns = EcoVim.plugins.rooter.patterns
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
  { "kylechui/nvim-surround",         lazy = false, config = true },
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
    "echasnovski/mini.align",
    lazy = false,
    version = false,
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "rareitems/printer.nvim",
    lazy = false,
    config = function()
      require "plugins.printer"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require "plugins.indent"
    end,
  },

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
  {
    "zbirenbaum/copilot.lua",
    disable = not EcoVim.plugins.copilot.enabled,
    event = "InsertEnter",
    config = true,
  },
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup()
    end,
    cmd = { "ChatGPT", "ChatGPTEditWithInstructions" },
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "plugins.git.gitsigns"
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
    lazy = false,
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
      "antoinemadec/FixCursorHold.nvim",
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
