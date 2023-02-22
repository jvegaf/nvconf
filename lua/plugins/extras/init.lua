return {
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
