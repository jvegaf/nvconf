return {
  "sudormrfbin/cheatsheet.nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  config = true,
  cmd = { "Cheatsheet", "CheatsheetEdit" },
  keys = {
    {"<leader>cc", "<cmd>Cheatsheet<cr>", desc = "Cheatsheet"},
  }
}
