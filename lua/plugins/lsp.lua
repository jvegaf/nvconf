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
  -- typescript-tools.nvim
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { { "folke/neoconf.nvim", cmd = "Neoconf", config = true }, "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function(_, opts)
      require("lsp.utils").on_attach(function(client, bufnr)
        if client.name == "tsserver" then
          vim.keymap.set(
            "n",
            "<leader>lo",
            "<cmd>TSToolsOrganizeImports<cr>",
            { buffer = bufnr, desc = "Organize Imports" }
          )
          vim.keymap.set("n", "<leader>lO", "<cmd>TSToolsSortImports<cr>", { buffer = bufnr, desc = "Sort Imports" })
          vim.keymap.set(
            "n",
            "<leader>lR",
            "<cmd>TSToolsRemoveUnusedImports<cr>",
            { buffer = bufnr, desc = "Removed Unused Imports" }
          )
          vim.keymap.set("n", "<leader>lF", "<cmd>TSToolsFixAll<cr>", { buffer = bufnr, desc = "Fix All" })
          vim.keymap.set(
            "n",
            "<leader>lA",
            "<cmd>TSToolsAddMissingImports<cr>",
            { buffer = bufnr, desc = "Add Missing Imports" }
          )
        end
      end)
      require("typescript-tools").setup(opts)
    end,
  },
  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "pmizio/typescript-tools.nvim",
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
