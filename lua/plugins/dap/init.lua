return {
  "mfussenegger/nvim-dap",
  config = function()
    require "plugins.config.dap"
  end,
  keys = {
    "<Leader>da",
    "<Leader>db",
    "<Leader>dc",
    "<Leader>dd",
    "<Leader>dh",
    "<Leader>di",
    "<Leader>do",
    "<Leader>dO",
    "<Leader>dt",
  },
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
  },
}
