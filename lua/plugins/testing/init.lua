return {
  "rcarriga/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "haydenmeade/neotest-jest",
  },
  config = function()
    require "plugins.config.neotest"
  end,
}
