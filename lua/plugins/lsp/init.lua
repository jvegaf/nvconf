return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    servers = nil,
    lazy = false,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = {
      "mason.nvim",
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    lazy = false,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    lazy = false,
  },
  {
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    lazy = false,
    cmd = { "ToggleDiag", "ToggleDiagDefault", "ToggleDiagOn", "ToggleDiagOff" },
    keys = {
      { "<leader>ltu",  "<Plug>(toggle-lsp-diag-underline)",        desc = "Toggle Diagnostic underline" },
      { "<leader>lts ", "<Plug>(toggle-lsp-diag-signs)",            desc = "Toggle Diagnostic signs" },
      { "<leader>ltv",  "<Plug>(toggle-lsp-diag-vtext)",            desc = "Toggle Diagnostic virtual text" },
      { "<leader>ltp",  "<Plug>(toggle-lsp-diag-update_in_insert)", desc = "Toggle Diagnostic update in insert" },
      { "<leader>ltd",  "<Plug>(toggle-lsp-diag)",                  desc = "Toggle Diagnostics" },
      { "<leader>ltdd", "<Plug>(toggle-lsp-diag-default)",          desc = "Toggle Diagnostics default" },
      { "<leader>ltdo", "<Plug>(toggle-lsp-diag-on)",               desc = "Toggle Diagnostics on" },
      { "<leader>ltdf", "<Plug>(toggle-lsp-diag-off)",              desc = "Toggle Diagnostics off" },
    },
  },
}
