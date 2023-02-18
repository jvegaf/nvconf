return {
  -- Themes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
      require("config.colorscheme")
    end,
  },
  { "tanvirtin/monokai.nvim" },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require("plugins.alpha")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
      require("plugins.treesitter")
    end,
    dependencies = {
      "mrjones2014/nvim-ts-rainbow",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
      {
        "m-demare/hlargs.nvim",
        config = function()
          require("hlargs").setup({ color = "#F7768E" })
        end,
      },
    },
  },

  -- Navigating (Telescope/Tree/Refactor)
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require("plugins.telescope")
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "cljoly/telescope-repo.nvim" },
    },
  },
  { "nvim-pack/nvim-spectre" },
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>e", "<cmd>lua require'nvim-tree'.focus()<CR>", desc = "NvimTree" },
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("plugins.tree")
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
      local nls = require("null-ls")
      nls.setup({
        sources = {
          -- nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
        },
      })
    end,
  },
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
    after = 'nvim-lspconfig',
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
      'hrsh7th/cmp-emoji',
      "hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
      { "tzachar/cmp-tabnine", build = "./install.sh" },
      {
        "David-Kunz/cmp-npm",
        config = function()
          require("plugins.cmp-npm")
        end,
      },
      { "L3MON4D3/LuaSnip",    dependencies = "rafamadriz/friendly-snippets" },
    },
    config = function()
      require("plugins.cmp")
    end,
  },

  -- LSP Addons
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("plugins.dressing")
    end,
  },
  { "onsails/lspkind-nvim" },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("plugins.trouble")
    end,
  },
  { "nvim-lua/popup.nvim" },
  {
    "ChristianChiarulli/nvim-gps",
    branch = "text_hl",
    config = function()
      require("plugins.gps")
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
      require("plugins.inlay-hints")
    end,
  },

  -- General
  { "AndrewRadev/switch.vim",            lazy = false },
  { "AndrewRadev/splitjoin.vim",         lazy = false },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    branch = "jsx",
    config = function()
      require("plugins.comment")
    end,
  },
  { "LudoPinelli/comment-box.nvim" },
  {
    "akinsho/nvim-toggleterm.lua",
    lazy = false,
    branch = "main",
    config = function()
      require("plugins.toggleterm")
    end,
  },
  { "tpope/vim-repeat",            lazy = false },
  { "tpope/vim-speeddating",       lazy = false },
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
    "voldikss/vim-browser-search",
    keys ={ { "<A-s>", ":'<,'>BrowserSearch<cr>", mode = "v", desc = "Search on web" } },
  },
  {
    "nacro90/numb.nvim",
    lazy = false,
    config = function()
      require("plugins.numb")
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    event = "BufEnter",
    config = function()
      require("plugins.todo-comments")
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    config = function()
      require("plugins.lightspeed")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function()
      require("plugins.whichkey")
    end,
  },
  {
    "ecosse3/galaxyline.nvim",
    config = function()
      require("plugins.galaxyline")
    end,
    event = "VeryLazy",
  },
  {
    "romgrk/barbar.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufAdd",
    config = function()
      require("plugins.barbar")
    end,
  },
  { "antoinemadec/FixCursorHold.nvim" }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
    init = function()
      local banned_messages = { "No information available",
        "LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+." }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        require("notify")(msg, ...)
      end
    end,
  },
  {
    "vuki656/package-info.nvim",
    event = "BufEnter package.json",
    config = function()
      require("plugins.package-info")
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
      require("plugins.cinnamon")
    end,
  },
  {
    "Shatur/neovim-session-manager",
    lazy = false,
    config = function()
      require("plugins.session-manager")
    end,
  },
  { "kylechui/nvim-surround",         lazy = false, config = true },
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
      require("plugins.printer")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require("plugins.indent")
    end,
  },

  -- Snippets & Language & Syntax
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins.autopairs")
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("plugins.colorizer")
    end,
  },
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.git.signs")
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    config = function()
      require("plugins.git.diffview")
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("plugins.git.conflict")
    end,
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    keys = {
      "<Leader>gwc",
      "<Leader>gww",
    },
    config = function()
      require("plugins.git.worktree")
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
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require("plugins.neotest")
    end,
  },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.dap")
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


-- local ensure_packer = function()
--   local fn = vim.fn
--   local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
--   if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
--     vim.cmd [[packadd packer.nvim]]
--     return true
--   end
--   return false
-- end
--
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]]
--
-- local packer_bootstrap = ensure_packer()
--
-- local use = require('packer').use
--
-- return require('packer').startup {
--   function()
--     use 'wbthomason/packer.nvim'
--     use 'nvim-lua/plenary.nvim'
--   --  use 'WhoIsSethDaniel/mason-tool-installer.nvim'
--
--     use {
--       'nvim-tree/nvim-web-devicons',
--       config = function()
--         require 'plugins.web-devicons'
--       end
--     }
--
--     use 'williamboman/mason.nvim'
--
--     -- LSP
--
--     use {
--       'neovim/nvim-lspconfig',
--       event = 'BufReadPre',
--       requires = {
--         'mason.nvim',
--         'williamboman/mason-lspconfig.nvim',
--         'hrsh7th/cmp-nvim-lsp',
--       },
--       servers = nil
--     }
--
--     -- LSP UIs
--     use {
--       'glepnir/lspsaga.nvim',
--       branch = 'main',
--       config = function()
--         require 'plugins.lspsaga'
--       end,
--     }
--
--     use {
--       'onsails/lspkind-nvim',
--       config = function()
--         require 'plugins.lspkind'
--       end,
--     }
--
--     -- LSP Cmp
--     use {
--       'hrsh7th/nvim-cmp',
--       event = 'InsertEnter',
--       requires = {
--         'hrsh7th/cmp-nvim-lua',
--         'hrsh7th/cmp-nvim-lsp',
--         'hrsh7th/cmp-buffer',
--         'hrsh7th/cmp-path',
--         'hrsh7th/cmp-cmdline',
--         'hrsh7th/cmp-emoji',
--         'hrsh7th/cmp-calc',
--         'saadparwaiz1/cmp_luasnip',
--         { 'tzachar/cmp-tabnine', run = 'powershell ./install.ps1' },
--         { 'L3MON4D3/LuaSnip', requires = 'rafamadriz/friendly-snippets' },
--       },
--       config = function()
--         require 'plugins.cmp'
--       end,
--     }
--
--     use {
--       'jose-elias-alvarez/null-ls.nvim',
--       event = 'BufReadPre',
--       requires = { 'mason.nvim' },
--       config = function()
--         require 'plugins.null-ls'
--       end,
--     }
--
--     use {
--       'nvim-lualine/lualine.nvim',
--       config = function()
--         require'plugins.lualine'
--       end
--     }
--
--     use {
--       'lukas-reineke/indent-blankline.nvim',
--       config = function()
--         require 'plugins.indent-blankline'
--       end
--     }
--
--     use {
--       'romgrk/barbar.nvim',
--       config = function()
--         require 'plugins.barbar'
--       end
--     }
--
--     use 'jose-elias-alvarez/typescript.nvim'
--
--     use {
--       'axelvc/template-string.nvim',
--       event = 'InsertEnter',
--       ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
--       config = function()
--         require('template-string').setup()
--       end,
--     }
--
--     use {
--       'lvimuser/lsp-inlayhints.nvim',
--       after = 'nvim-lspconfig',
--       branch = 'main',
--       config = function()
--         require 'plugins.inlay-hints'
--       end,
--     }
--
--
--     -- Treesitter
-- 	use {
-- 		"nvim-treesitter/nvim-treesitter",
-- 		event = "BufReadPre",
-- 		config = function()
-- 			require("plugins.treesitter")
-- 		end,
-- 		requires = {
-- 			"mrjones2014/nvim-ts-rainbow",
-- 			"JoosepAlviste/nvim-ts-context-commentstring",
-- 			"nvim-treesitter/nvim-treesitter-textobjects",
-- 			"RRethy/nvim-treesitter-textsubjects",
-- 			{
-- 				"m-demare/hlargs.nvim",
-- 				config = function()
-- 					require("hlargs").setup({ color = "#F7768E" })
-- 				end,
-- 			},
-- 		},
-- 	}
--
--     use {
--       'nvim-telescope/telescope.nvim',
--       config = function()
--         require 'plugins.telescope'
--       end,
--       requires = {
--         { "nvim-lua/popup.nvim" },
--         { "nvim-lua/plenary.nvim" },
--         { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--         { "cljoly/telescope-repo.nvim" },
--         {'nvim-telescope/telescope-file-browser.nvim'}
--       }
--     }
--
--     use 'rcarriga/nvim-notify'
--
--     use {
--       'folke/lsp-colors.nvim',
--       after = 'nvim-lspconfig',
--       event = 'BufRead',
--     }
--
--     use {
--       'kevinhwang91/nvim-ufo',
--       requires = 'kevinhwang91/promise-async',
--       config = function()
--         vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
--         vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
--         vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
--       end,
--     }
--
--     use {
--       'Shatur/neovim-session-manager',
--       requires = 'nvim-lua/plenary.nvim',
--     }
--
--     use 'moll/vim-bbye'
--
--     use {
--       'windwp/nvim-autopairs',
--       config = function()
--         require 'plugins.autopairs'
--       end,
--     }
--
--
--     use {
--       'numToStr/Comment.nvim',
--       requires = {
--       'JoosepAlviste/nvim-ts-context-commentstring',
--       },
--       config = function()
--         require 'plugins.comment'
--       end
--     }
--
--     use {
--       'norcalli/nvim-colorizer.lua',
--       config = function()
--         require 'plugins.colorizer'
--       end
--     }
--
--     use 'dinhhuy258/git.nvim' -- For git blame & browse
--
--     -- Git
--
--     use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, event = 'BufRead' }
--
--     use {
--       'sindrets/diffview.nvim',
--       requires = 'nvim-lua/plenary.nvim',
--       config = function()
--         require 'plugins.diffview'
--       end
--     }
--
--     use {
--       'akinsho/git-conflict.nvim',
--       tag = '*',
--       config = function()
--         require 'plugins.conflict'
--       end
--     }
--
--     use 'mhinz/vim-signify'
--
--     use 'adoy/vim-php-refactoring-toolbox'
--
--     use {
--       'ThePrimeagen/git-worktree.nvim',
--       config = function()
--         require 'plugins.git.gitworktree'
--       end
--     }
--
--     use {
--       'nvim-tree/nvim-tree.lua',
--       requires = {
--         'nvim-tree/nvim-web-devicons',
--       }, config = function()
--         require 'plugins.nvim-tree'
--       end,
--     }
--
--     use {
--       'weilbith/nvim-code-action-menu',
--       cmd = 'CodeActionMenu',
--       after = 'nvim-lspconfig',
--     }
--
--     use {
--       'junegunn/vim-easy-align',
--       event = 'BufReadPost',
--     }
--
--     -- Motion
--     use {
--       'phaazon/hop.nvim',
--       config = function()
--         require 'plugins.hop'
--       end
--     }
--
--     use {
--       'gbprod/stay-in-place.nvim',
--       config = function()
--         require('stay-in-place').setup()
--       end,
--     }
--
--     -- Keybinding
--     use {
--       'folke/which-key.nvim',
--       config = function()
--         require 'plugins.whichkey'
--       end
--     }
--
--     use 'antoinemadec/FixCursorHold.nvim'
--
--     use {
--       'lalitmee/browse.nvim',
--       requires = { 'nvim-telescope/telescope.nvim' },
--     }
--
--     use { 'voldikss/vim-browser-search' }
--
--     use 'windwp/nvim-spectre'
--
--     use { 'normen/vim-pio' }
--
--     use {
--       'mg979/vim-visual-multi',
--       config = function()
--         vim.g.VM_leader = ';'
--       end,
--     }
--
--     use {
--       'akinsho/toggleterm.nvim',
--       tag = '*',
--       config = function()
--         require('toggleterm').setup()
--       end,
--     }
--
--     use {
--       'folke/trouble.nvim',
--       requires = 'kyazdani42/nvim-web-devicons',
--     }
--
--     use {
--       'goolord/alpha-nvim',
--       requires = {
--         'nvim-tree/nvim-web-devicons',
--       },
--       config = function()
--         require 'plugins.alpha'
--       end,
--     }
--
--     use 'jvegaf/move.nvim'
--
--     -- Themes
--
--     use 'RRethy/nvim-base16'
--
--     use 'navarasu/onedark.nvim'
--
--     use 'tanvirtin/monokai.nvim'
--
--     use 'folke/tokyonight.nvim'
--
--     ----------------------
--
--     if packer_bootstrap then
--       require('packer').sync()
--     end
--   end,
--   config = {
--     display = {
--       open_fn = function()
--         return require('packer.util').float { border = 'single' }
--       end,
--     },
--     log = { level = 'info' },
