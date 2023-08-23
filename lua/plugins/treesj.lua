return {
  "Wansmer/treesj",
  keys = { { "<leader>j", "<CMD>TSJToggle<CR>", desc = "Toggle Split Join" } },
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  opts = { use_default_keymaps = false },
}
