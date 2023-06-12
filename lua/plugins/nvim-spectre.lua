return {
  "nvim-pack/nvim-spectre",
  opts = {
    live_update = true,
  },
  config = function(_, opts)
    require("spectre").setup(opts)
  end,
  keys = {
    { "<leader>sr", "<cmd>lua require('spectre').open()<cr>", desc = "Replace" },
    { "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", desc = "Replace Word" },
    { "<leader>sf", "<cmd>lua require('spectre').open_file_search()<cr>", desc = "Replace Buffer" },
  },
}
