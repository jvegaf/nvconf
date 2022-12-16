local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path })
end

return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Needed to load first
    use { "lewis6991/impatient.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "kyazdani42/nvim-web-devicons" }
    use {
      "goolord/alpha-nvim",
      config = function()
        require "plugins.alpha"
      end
    }

    -- Themes
    use { "morhetz/gruvbox" }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      requires = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "RRethy/nvim-treesitter-textsubjects",
        "p00f/nvim-ts-rainbow",
        "JoosepAlviste/nvim-ts-context-commentstring",
        {
          "ChristianChiarulli/nvim-gps",
          branch = "text_hl",
          config = function()
            require "plugins.gps"
          end
        }
      },
      config = function()
        require "plugins.treesitter"
      end
    }
    use {
      "m-demare/hlargs.nvim",
      config = function()
        require("hlargs").setup({ color = "#F7768E" })
      end
    }

    use {
      "stevearc/aerial.nvim",
      config = function()
        require "plugins.aerial"
      end
    }

    -- Navigating (Telescope/Tree/Refactor)
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-telescope/telescope-project.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "cljoly/telescope-repo.nvim",
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require "plugins.telescope"
      end
    }
    use { "kevinhwang91/nvim-bqf", ft = "qf" }
    use { "nvim-pack/nvim-spectre" }
    use {
      "nvim-tree/nvim-tree.lua",
      config = function()
        require "plugins.nvim-tree"
      end
    }
    use {
      "gbprod/stay-in-place.nvim",
      config = function()
        require("stay-in-place").setup({})
      end
    }

    -- LSP Base
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "neovim/nvim-lspconfig" }

    -- LSP Cmp
    use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
        require "plugins.cmp"
      end,
      requires = {
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        {
          "L3MON4D3/LuaSnip",
          requires = { "rafamadriz/friendly-snippets" }
        },
        {
          "David-Kunz/cmp-npm",
          requires = "nvim-lua/plenary.nvim",
          config = function()
            require "plugins.cmp-npm"
          end
        },
      }
    }

    -- LSP Addons
    use {
      "stevearc/dressing.nvim",
      requires = "MunifTanjim/nui.nvim",
      config = function()
        require "plugins.dressing"
      end
    }
    use { "onsails/lspkind-nvim" }
    use {
      "folke/lsp-trouble.nvim",
      config = function()
        require "plugins.trouble"
      end
    }
    use { "nvim-lua/popup.nvim" }
    use { "jose-elias-alvarez/typescript.nvim" }
    use { "axelvc/template-string.nvim", config = function() require("template-string").setup() end }
    use { "lvimuser/lsp-inlayhints.nvim", config = function() require("lsp-inlayhints").setup() end }

    use {
      "p00f/clangd_extensions.nvim",
      config = function()
        require "plugins.clangd-extensions"
      end
    }

    -- General
    use { "AndrewRadev/switch.vim" }
    use { "AndrewRadev/splitjoin.vim" }
    use {
      "numToStr/Comment.nvim",
      config = function()
        require "plugins.comment"
      end
    }
    use { "LudoPinelli/comment-box.nvim" }
    use {
      "akinsho/nvim-toggleterm.lua",
      branch = "main",
      config = function()
        require "plugins.toggleterm"
      end
    }
    use { "tpope/vim-repeat" }
    use { "mg979/vim-visual-multi", config = function() vim.g.VM_leader = ";" end }
    use {
      "folke/todo-comments.nvim",
      config = function()
        require "plugins.todo-comments"
      end
    }
    use {
      "folke/which-key.nvim",
      event = "BufWinEnter",
      keys = { '"', "<leader>", "'", "`" },
      config = function()
        require "plugins.which-key"
      end
    }
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      requires = "Iron-E/nvim-highlite",
      config = function()
        require "plugins.galaxyline"
      end,
    }
    use {
      "akinsho/bufferline.nvim",
      tag = "v3.*",
      requires = "nvim-tree/nvim-web-devicons"
    }
    use { "antoinemadec/FixCursorHold.nvim" } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
    use { "rcarriga/nvim-notify" }
    use {
      "vuki656/package-info.nvim",
      event = "BufEnter package.json",
      config = function()
        require "plugins.package-info"
      end
    }
    use {
      "declancm/cinnamon.nvim",
      config = function()
        require "plugins.cinnamon"
      end
    }
    use {
      "Shatur/neovim-session-manager",
      config = function()
        require "plugins.session-manager"
      end
    }
    use {
      "kylechui/nvim-surround",
      config = function()
        require("nvim-surround").setup({})
      end
    }
    use {
      "sunjon/shade.nvim",
      config = function()
        require("shade").setup();
        require("shade").toggle();
      end
    }
    -- use {
    --   "kevinhwang91/nvim-ufo",
    --   requires = "kevinhwang91/promise-async",
    --   config = function()
    --     require "plugins.nvim-ufo"
    --   end
    -- }
    use {
      "echasnovski/mini.nvim",
      config = function()
        require("mini.align").setup()
      end
    }
    use { "voldikss/vim-browser-search" }
    use { "normen/vim-pio" }
    use { "ziontee113/syntax-tree-surfer",
      cmd = {
        "STSSwapUpNormal",
        "STSSwapDownNormal",
        "STSSelectCurrentNode",
        "STSSelectMasterNode",
        "STSSelectParentNode",
        "STSSelectChildNode",
        "STSSelectPrevSiblingNode",
        "STSSelectNextSiblingNode",
        "STSSwapNextVisual",
        "STSSwapPrevVisual",
      },
      config = function()
        require "plugins.syntax-tree-surfer"
      end
    }

    -- Snippets & Language & Syntax
    use {
      "windwp/nvim-autopairs",
      config = function()
        require "plugins.autopairs"
      end
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "plugins.indent"
      end
    }
    use {
      "NvChad/nvim-colorizer.lua",
      config = function()
        require "plugins.colorizer"
      end
    }

    -- Git
    use { "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      event = "BufRead",
      config = function()
        require "plugins.git.signs"
      end
    }
    use { 
      "sindrets/diffview.nvim",
      config = function()
        require "plugins.git.diffview" 
      end
    }
    use { 
      "akinsho/git-conflict.nvim", 
      tag = "*", 
      config = function()
        require "plugins.git.conflict" 
      end
  }
    use { 
      "ThePrimeagen/git-worktree.nvim",
      config = function()
        require"plugins.git.worktree" 
      end
    }
    use { "kdheepak/lazygit.nvim" }

    -- Testing
    use {
      "rcarriga/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "haydenmeade/neotest-jest"
      },
      config = function()
        require "plugins.neotest"
      end
    }

    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    compile_path = compile_path,
    disable_commands = true,
    max_jobs = 50,
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end
    }
  }
})
