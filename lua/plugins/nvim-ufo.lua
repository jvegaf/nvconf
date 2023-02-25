return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  keys = {
    { "zR", "<cmd>lua require('ufo').openAllFolds", desc = "Unfold all" },
    { "zM", "<cmd>lua require('ufo').closeAllFolds", desc = "Fold all" },
    { "zr", "<cmd>lua require('ufo').openFoldsExceptKinds", desc = "Unfold except kind" },
  },
  config = true,
}
