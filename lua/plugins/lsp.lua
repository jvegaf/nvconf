return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/typescript.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    {
      "b0o/SchemaStore.nvim",
      version = false, -- last release is way too old
    },
  },
  lazy = false,
  servers = nil,
}
