return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  keys = {
    { "zR", "<cmd>lua require('ufo').openAllFolds<cr>", desc = "Unfold all" },
    { "zM", "<cmd>lua require('ufo').closeAllFolds<cr>", desc = "Fold all" },
    { "zr", "<cmd>lua require('ufo').openFoldsExceptKinds<cr>", desc = "Unfold except kind" },
  },
  config = true,
}
