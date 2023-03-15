local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

local packer_bootstrap = ensure_packer()

local use = require('packer').use

return require('packer').startup {
  function()
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim' -- Common utilities
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
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
    use {
      'jay-babu/mason-null-ls.nvim',
      requirements = {
        'williamboman/mason.nvim',
      },
      cmd = { 'NullLsInstall', 'NullLsUninstall' },
      config = function()
        require 'plugins.mason_null-ls'
      end,
    }
    -- LSP UIs
    use {
      'glepnir/lspsaga.nvim',
      branch = 'main',
      config = function()
        require('lspsaga').setup {}
      end,
    }

    use 'nvim-lualine/lualine.nvim' -- Statusline

    use 'lukas-reineke/indent-blankline.nvim'

    use 'romgrk/barbar.nvim'

    use 'jose-elias-alvarez/typescript.nvim'

    use {
      'axelvc/template-string.nvim',
      event = 'InsertEnter',
      ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
      config = function()
        require('template-string').setup()
      end,
    }

    use {
      'lvimuser/lsp-inlayhints.nvim',
      branch = 'main', -- or "anticonceal"
      config = function()
        require 'plugins.inlay-hints'
      end,
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'windwp/nvim-ts-autotag',
        'RRethy/nvim-treesitter-textsubjects',
        'JoosepAlviste/nvim-ts-context-commentstring',
        'HiPhish/nvim-ts-rainbow2',
      },
      run = function()
        require('nvim-treesitter.install').update { with_sync = true }
      end,
    }

    use 'nvim-tree/nvim-web-devicons' -- File icons

    use 'nvim-telescope/telescope.nvim'

    use 'nvim-telescope/telescope-file-browser.nvim'

    use 'rcarriga/nvim-notify'

    use {
      'folke/lsp-colors.nvim',
      event = 'BufRead',
    }

    use {
      'kevinhwang91/nvim-ufo',
      requires = 'kevinhwang91/promise-async',
      config = function()
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
      end,
    }

    use {
      'Shatur/neovim-session-manager',
      requires = 'nvim-lua/plenary.nvim',
    }

    use 'moll/vim-bbye'

    use 'windwp/nvim-autopairs'


    use { 'numToStr/Comment.nvim', requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    } }
    use 'norcalli/nvim-colorizer.lua'

    use 'dinhhuy258/git.nvim' -- For git blame & browse

    -- Git

    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, event = 'BufRead' }

    use {
      'sindrets/diffview.nvim',
      requires = 'nvim-lua/plenary.nvim',
    }

    use {
      'akinsho/git-conflict.nvim',
      tag = '*',
    }

    use 'mhinz/vim-signify'

    use 'adoy/vim-php-refactoring-toolbox'

    use 'ThePrimeagen/git-worktree.nvim'

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons',
      },
    }

    use {
      'weilbith/nvim-code-action-menu',
      cmd = 'CodeActionMenu',
      after = 'nvim-lspconfig',
    }

    use {
      'tzachar/cmp-tabnine',
      after = 'nvim-cmp',
      -- run = 'powershell ./install.ps1',
      run = './install.sh',
      requires = 'hrsh7th/nvim-cmp',
    }

    use {
      'junegunn/vim-easy-align',
      event = 'BufReadPost',
    }

    -- Motion
    use 'phaazon/hop.nvim'
    -- use "jinh0/eyeliner.nvim"

    -- Keybinding
    use 'folke/which-key.nvim'

    use 'antoinemadec/FixCursorHold.nvim'

    use {
      'lalitmee/browse.nvim',
      requires = { 'nvim-telescope/telescope.nvim' },
    }

    use { 'voldikss/vim-browser-search' }

    use 'windwp/nvim-spectre'

    use { 'normen/vim-pio' }

    use {
      'mg979/vim-visual-multi',
      config = function()
        vim.g.VM_leader = ';'
      end,
    }

    use {
      'akinsho/toggleterm.nvim',
      tag = '*',
      config = function()
        require('toggleterm').setup()
      end,
    }

    use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
    }

    use {
      'goolord/alpha-nvim',
      requires = {
        'nvim-tree/nvim-web-devicons',
      },
    }

    use 'jvegaf/move.nvim'

    -- Themes

    use 'RRethy/nvim-base16'

    use 'navarasu/onedark.nvim'

    use 'tanvirtin/monokai.nvim'

    use 'folke/tokyonight.nvim'

    ----------------------

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
    },
    log = { level = 'info' },
  },
}
