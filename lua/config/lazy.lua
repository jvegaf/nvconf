local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "plugins" },
    { import = "plugins.lsp" },
    { import = "plugins.dashboard" },
    { import = "plugins.git" },
    { import = "plugins.dap" },
    { import = "plugins.extras" },
  },
  defaults = { lazy = true },
  install = { missing = true, colorscheme = { "tokyonight" } },
  checker = { enabled = true },
  change_detection = {
    enabled = true,
    notify = true,
  },
  performance = {
    cache = {
      enabled = false,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
  ui = {
    border = "rounded",
  },
}
