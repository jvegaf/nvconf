return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  config = function()
    require "plugins.config.telescope"
  end,
  dependencies = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "stevearc/aerial.nvim",                      config = true },
    { "nvim-telescope/telescope-fzf-native.nvim",  build = "make" },
    { "cljoly/telescope-repo.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-media-files.nvim" },
    { "nvim-telescope/telescope-node-modules.nvim" },
    { "gbrlsnchs/telescope-lsp-handlers.nvim" },
    { "xiyaowong/telescope-emoji.nvim" },
    { "LinArcX/telescope-changes.nvim" },
    { "FeiyouG/command_center.nvim" },
    { "debugloop/telescope-undo.nvim" },
    { "danielvolchek/tailiscope.nvim" },
    { "gbprod/yanky.nvim",                         config = true },
  },
}
