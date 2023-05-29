return {
  {
    "jcdickinson/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    event = "InsertEnter",
    cmd = { "Codeium" },
    config = function()
      require("codeium").setup {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium" } }))
    end,
  },
}
