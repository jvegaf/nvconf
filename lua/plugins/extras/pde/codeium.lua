return {
  "jcdickinson/codeium.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup {}
  end,
}
