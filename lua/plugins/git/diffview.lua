return {
  "sindrets/diffview.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },
  cmd = { "DiffviewFileHistory", "DiffviewOpen" },
  keys = {
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "File history" },
  },
  config = true,
}
