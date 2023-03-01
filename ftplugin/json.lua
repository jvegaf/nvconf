local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  n = {
    name = "NPM",
    d = { "<cmd>PackageInfoDelete<cr>", "Delete Package" },
    p = { "<cmd>PackageInfoChangeVersion<cr>", "Change Package Version" },
    i = { "<cmd>PackageInfoInstall<cr>", "Install Package" },
    u = { "<cmd>PackageInfoUpdate<cr>", "Update Package" },
  },
}

which_key.register(mappings, opts)
