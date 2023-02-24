return {
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  config = true,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
  keys = {
    { "lj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next diagnostic" },
    { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Symbol Docs" },
    { "ld", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
    { "lh", "<cmd>Lspsaga lsp_finder<cr>", desc = "Find definition" },
    { "lr", "<cmd>Lspsaga rename ++project<cr>", desc = "Rename" },
    { "<leader>a", "<cmd>Lspsaga code_action<cr>", mode = { "n", "v" }, desc = "Code action" },
    { "<leader>lb", "<cmd>Lspsaga show_buffer_diagnostics<cr>", desc = "Buffer diagnostics" },
    { "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "Line diagnostics" },
    { "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Cursor diagnostics" },
    { "<leader>lt", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Type definition" },
    { "<leader>li", "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming Calls" },
    { "<leader>lo", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing Calls" },
    { "<leader>o", "<cmd>Lspsaga outline<cr>", desc = "Outline Symbols" },
    { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", mode = "i", desc = "Outline Symbols" },
  },
}
