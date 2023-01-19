local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer_bootstrap = ensure_packer()

local use = require('packer').use



return require('packer').startup({ function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-emoji' -- nvim-cmp source for neovim's built-in LSP
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'WhoIsSethDaniel/mason-tool-installer.nvim'
  -- LSP UIs
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require('lspsaga').setup({})
    end,
  })

  use 'L3MON4D3/LuaSnip'

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
      "p00f/nvim-ts-rainbow",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  }

  use 'nvim-tree/nvim-web-devicons' -- File icons

  use 'nvim-telescope/telescope.nvim'

  use 'nvim-telescope/telescope-file-browser.nvim'

  use {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  }

  use {
    -- 'ThePrimeagen/harpoon',
    "christianchiarulli/harpoon",
    requires = 'nvim-lua/plenary.nvim'
  }

  use {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    after = "telescope.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  }

  use {
    'Shatur/neovim-session-manager',
    requires = 'nvim-lua/plenary.nvim'
  }

  use 'moll/vim-bbye'

  use 'windwp/nvim-autopairs'

  use 'windwp/nvim-ts-autotag'

  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use 'norcalli/nvim-colorizer.lua'

  use {
    'akinsho/nvim-bufferline.lua',
    tag = 'v3.*',
    event = 'BufWinEnter',
    requires = 'nvim-tree/nvim-web-devicons'
  }
  -- use 'github/copilot.vim'

  use 'dinhhuy258/git.nvim' -- For git blame & browse

  -- Git

  use { "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    event = "BufRead",
  }

  use "sindrets/diffview.nvim"

  use {
    "akinsho/git-conflict.nvim",
    tag = "*",
  }

  use "ThePrimeagen/git-worktree.nvim"

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }

  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
    after = 'nvim-lspconfig'
  }

  use {
    "tzachar/cmp-tabnine",
    after = "nvim-cmp",
    run = "powershell ./install.ps1",
    requires = "hrsh7th/nvim-cmp",
  }

  use {
    'junegunn/vim-easy-align',
    event = 'BufReadPost'
  }

  -- Motion
  use "phaazon/hop.nvim"
  -- use "jinh0/eyeliner.nvim"

  -- Keybinding
  use "folke/which-key.nvim"

  use 'antoinemadec/FixCursorHold.nvim'

  use { "voldikss/vim-browser-search" }

  use { "normen/vim-pio" }

  use { "mg979/vim-visual-multi", config = function() vim.g.VM_leader = ";" end }

  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup()
    end
  }

  use {
    'goolord/alpha-nvim',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }

  use 'jvegaf/move.nvim'

  -- Themes
  use 'navarasu/onedark.nvim'


  if packer_bootstrap then
    require('packer').sync()
  end

end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  } })
