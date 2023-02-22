return {
  "kdheepak/lazygit.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  cmd = { "LazyGit", "LazyGitCurrentFile", "LazyGitFilterCurrentFile", "LazyGitFilter" },
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 1

    require("telescope").load_extension "lazygit"
  end,
}
