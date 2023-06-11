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
    use 'folke/neodev.nvim'
    use { 'onsails/lspkind-nvim', config = function() require('plugins.lspkind') end, }            -- vscode-like pictograms

    -- CMP
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-emoji',
        'saadparwaiz1/cmp_luasnip',
      },
      config = function()
        require('plugins.cmp')
      end,
    }

    use 'neovim/nvim-lspconfig'           -- LSP
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

    -- Mason
    use {
      'williamboman/mason-lspconfig.nvim',
      requirements = {
        'williamboman/mason.nvim'
      },
      config = function()
        require('plugins.mason')
      end
    }

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
        require('plugins.lspsaga')
      end,
    }

    use {
      'nvim-lualine/lualine.nvim',
      config = function()
        require('plugins.lualine')
      end,
    }

    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('plugins.indent-blankline')
      end,
    }

    use {
      'romgrk/barbar.nvim',
      config = function ()
        require('plugins.barbar')
      end,
    }

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
        {'windwp/nvim-ts-autotag', config = function() require('plugins.ts-autotag') end,},
        'RRethy/nvim-treesitter-textsubjects',
        'JoosepAlviste/nvim-ts-context-commentstring',
        'HiPhish/nvim-ts-rainbow2',
      },
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
      config = function ()
        require('plugins.treesitter')
      end
    }

    use 'nvim-tree/nvim-web-devicons' -- File icons

    use {
      'nvim-telescope/telescope.nvim',
      requires = {
          'nvim-telescope/telescope-file-browser.nvim'
      },
      config = function()
        require('plugins.telescope')
      end,
    }

    use {
      'rcarriga/nvim-notify',
      config = function ()
        require('plugins.nvim-notify')
      end
    }

    use {
      'folke/lsp-colors.nvim',
      event = 'BufRead',
      config = function ()
        require('plugins.lsp-colors')
      end,
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
      config = function ()
        require('plugins.session-manager')
      end
    }

    use 'moll/vim-bbye'

    use {
      'windwp/nvim-autopairs',
      config = function()
        require('plugins.autopairs')
      end,
    }


    use {
      'numToStr/Comment.nvim',
      requires = {
        'JoosepAlviste/nvim-ts-context-commentstring',
      },
      config = function()
        require('plugins.comment')
      end,
    }

    use {
      'norcalli/nvim-colorizer.lua',
      config = function ()
        require('plugins.colorizer')
      end
    }

    -- Git

    use {
      'dinhhuy258/git.nvim',
      config = function ()
        require('plugins.git')
      end,
    }

    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      event = 'BufRead',
      config = function()
        require('plugins.gitsigns')
      end,
    }

    use {
      'sindrets/diffview.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('plugins.diffview')
      end,
    }

    use {
      'akinsho/git-conflict.nvim',
      tag = '*',
      config = function()
        require('plugins.conflict')
      end,
    }

    use 'mhinz/vim-signify'

    use {
      'ThePrimeagen/git-worktree.nvim',
      config = function()
        require('plugins.gitworktree')
      end
    }

    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("plugins.neotree")
      end
    }

    use {
      'weilbith/nvim-code-action-menu',
      cmd = 'CodeActionMenu',
      after = 'nvim-lspconfig',
    }

    -- use {
    --   'tzachar/cmp-tabnine',
    --   after = 'nvim-cmp',
    --   -- run = 'powershell ./install.ps1',
    --   run = './install.sh',
    --   requires = 'hrsh7th/nvim-cmp',
    -- }

    use {
      'junegunn/vim-easy-align',
      event = 'BufReadPost',
    }

    -- Motion
    use {
      'phaazon/hop.nvim',
      config = function ()
        require('plugins.hop')
      end
    }

    -- Keybinding
    use {
      'folke/which-key.nvim',
      config = function()
        require('plugins.which-key')
      end
    }

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
        require('plugins.toggleterm')
      end,
    }

    use {
      'folke/trouble.nvim',
      requires = 'nvim-tree/nvim-web-devicons',
    }

    use {
      'goolord/alpha-nvim',
      requires = {
        'nvim-tree/nvim-web-devicons',
      },
      config = function ()
        require('plugins.alpha')
      end
    }

    -- Themes

    use 'RRethy/nvim-base16'

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
