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

  -- Treesitter
  

    {
    "RRethy/vim-illuminate",
  },
  -- Telescope
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
      require "plugins.config.tree"
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
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require "plugins.config.dressing"
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require "plugins.config.trouble"
    end,
  },
  { "nvim-lua/popup.nvim" },
  {
    "ChristianChiarulli/nvim-gps",
    branch = "text_hl",
    config = function()
      require "plugins.config.gps"
    end,
  },
  { "jose-elias-alvarez/typescript.nvim" },
  {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    config = true, -- run require("template-string").setup()
  },
  -- General
  {
    "numToStr/Comment.nvim",
    lazy = true,
    branch = "jsx",
    config = function()
      require "plugins.config.comment"
    end,
  },
  { "LudoPinelli/comment-box.nvim" },
  {
    "akinsho/nvim-toggleterm.lua",
    lazy = false,
    version = "*",
    config = function()
      require "plugins.config.toggleterm"
    end,
  },
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
      require "plugins.config.todo-comments"
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    config = function()
      require "plugins.config.lightspeed"
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function()
      require "plugins.config.whichkey"
    end,
  },
  {
    "ecosse3/galaxyline.nvim",
    config = function()
      require "plugins.config.galaxyline"
    end,
    event = "VeryLazy",
  },
  {
    "declancm/cinnamon.nvim",
    config = function()
      require "plugins.config.cinnamon"
    end,
  },
  { "kylechui/nvim-surround", lazy = false, config = true },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require "plugins.config.indent-blankline"
    end,
  },
  {
    "lalitmee/browse.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  { "normen/vim-pio" },
  -- Snippets & Language & Syntax
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "plugins.config.colorizer"
    end,
  },
}
