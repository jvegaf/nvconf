return {
  -- lsp-inlayhints.nvim
  {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "main", -- or "anticonceal"
    opts = {
      inlay_hints = {
        parameter_hints = {
          show = true,
          prefix = "<- ",
          separator = ", ",
          remove_colon_start = false,
          remove_colon_end = true,
        },
        type_hints = {
          -- type and other hints
          show = true,
          prefix = "",
          separator = ", ",
          remove_colon_start = false,
          remove_colon_end = false,
        },
        only_current_line = false,
        -- separator between types and parameter hints. Note that type hints are
        -- shown before parameter
        labels_separator = "  ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- highlight group
        highlight = "LspCodeLens",
      },
      enabled_at_startup = true,
      debug_mode = false,
    },
  },
  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/typescript.nvim",
      "williamboman/mason-lspconfig.nvim",
      "lvimuser/lsp-inlayhints.nvim",
      "hrsh7th/cmp-nvim-lsp",
      {
        "b0o/SchemaStore.nvim",
        version = false, -- last release is way too old
      },
    },
    lazy = false,
    servers = nil,
  },
}
