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
    { import = "plugins.testing" },
    { import = "plugins.dap" },
  },
  defaults = { lazy = true, version = "*" },
  install = { missing = true, colorscheme = { "tokyonight" } },
  checker = { enabled = true },
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
  debug = true,
  ui = {
    border = "rounded",
  },
}

