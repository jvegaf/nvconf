return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
    "onsails/lspkind-nvim",
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
          require "cmp-npm".setup{
            ignore = {},
            only_semantic_versions = true,
          }
        end,
      },
      { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
    },
    config = function()
      require "plugins.config.cmp"
    end,
  }
