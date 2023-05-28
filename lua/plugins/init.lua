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
  { "RRethy/nvim-base16", lazy = false },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require "plugins.configs.dashboard"
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
      require "plugins.configs.treesitter"
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
  -- Navigating (Telescope/Tree/Refactor)
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require "plugins.configs.telescope"
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
    },
  },
  { "nvim-pack/nvim-spectre" },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTreeToggle" } },
    config = function()
      require "plugins.configs.tree"
    end,
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
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    event = "BufReadPre",
    opts = {},
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
      require "plugins.configs.mason-installer"
    end,
  },

  -- Formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    config = function()
      require "plugins.configs.null_ls"
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
          require "plugins.configs.cmp-npm"
        end,
      },
      {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = "rafamadriz/friendly-snippets",
      },
      {
        "zbirenbaum/copilot-cmp",
        disable = true,
        config = function()
          require("copilot_cmp").setup()
        end,
      },
      {
        "jcdickinson/codeium.nvim",
        event = "InsertEnter",
        cmd = "Codeium",
        config = function()
          require("codeium").setup {}
        end,
      },
    },
    config = function()
      require "plugins.configs.cmp"
    end,
  },
  -- LSP Addons
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require "plugins.configs.dressing"
    end,
  },
  { "onsails/lspkind-nvim" },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require "plugins.configs.trouble"
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
      require "plugins.configs.gps"
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
    "MattesGroeger/vim-bookmarks",
    cmd = { "BookmarkShowAll", "BookmarkAnnotate", "BookmarkToggle", "BookmarkNext", "BookmarkPrev" },
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "main", -- or "anticonceal"
    config = function()
      require "plugins.configs.inlay-hints"
    end,
  },

  -- General

  { "AndrewRadev/switch.vim", lazy = false },
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
    event = "BufEnter",
    dependencies = {"lvimuser/lsp-inlayhints.nvim"},
    branch = "jsx",
    config = function()
      require "plugins.configs.comment"
    end,
  },
  { "LudoPinelli/comment-box.nvim" },
  {
    "akinsho/nvim-toggleterm.lua",
    lazy = false,
    branch = "main",
    config = function()
      require "plugins.configs.toggleterm"
    end,
    keys = {
      { "<A-1>", "<Cmd>1ToggleTerm direction=vertical<Cr>", desc = "Terminal #1", mode = { "t", "n" } },
      { "<A-2>", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal #2", mode = { "t", "n" } },
      { "<A-3>", "<Cmd>3ToggleTerm direction=horizontal<Cr>", desc = "Terminal #3", mode = { "t", "n" } },
    },
  },
  { "tpope/vim-repeat", lazy = false },
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
      require "plugins.configs.todo-comments"
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    config = function()
      require "plugins.configs.lightspeed"
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function()
      require "plugins.configs.whichkey"
    end,
  },
  {
    "ecosse3/galaxyline.nvim",
    config = function()
      require "plugins.configs.galaxyline"
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
      require "plugins.configs.bufferline"
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
        require "notify"(msg, ...)
      end
    end,
  },
  {
    "vuki656/package-info.nvim",
    event = "BufEnter package.json",
    config = function()
      require "plugins.configs.package-info"
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
      require "plugins.configs.cinnamon"
    end,
  },
  {
    "airblade/vim-rooter",
    setup = function()
      vim.g.rooter_patterns = { ".git", "package.json", "_darcs", ".bzr", ".svn", "Makefile" }
    end,
  },
  {
    "Shatur/neovim-session-manager",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    config = function()
      require "plugins.configs.session-manager"
    end,
  },
  { "kylechui/nvim-surround", lazy = false, config = true },
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
    "junegunn/vim-easy-align",
    event = "User BufReadPre",
    keys = { { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "EasyAlign" } },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require "plugins.configs.indent"
    end,
  },

  -- Snippets & Language & Syntax
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "plugins.configs.autopairs"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "plugins.configs.colorizer"
    end,
  },
  {
    "Wansmer/treesj",
    keys = { { "<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle Split Join" } },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
  {
    "zbirenbaum/copilot.lua",
    disable = true,
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
      require "plugins.configs.git.gitsigns"
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    config = function()
      require "plugins.configs.git.diffview"
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require "plugins.configs.git.conflict"
    end,
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    keys = {
      "<Leader>gwc",
      "<Leader>gww",
    },
    config = function()
      require "plugins.configs.git.worktree"
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
      require "plugins.configs.neotest"
    end,
  },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "plugins.configs.dap"
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