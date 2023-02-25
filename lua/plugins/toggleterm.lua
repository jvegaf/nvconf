return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<A-1>", "<Cmd>1ToggleTerm direction=vertical<Cr>",   desc = "Terminal #1", mode = { "t", "n" } },
    { "<A-2>", "<Cmd>2ToggleTerm<Cr>",                      desc = "Terminal #2", mode = { "t", "n" } },
    { "<A-3>", "<Cmd>3ToggleTerm direction=horizontal<Cr>", desc = "Terminal #3", mode = { "t", "n" } },
  },
  cmd = { "ToggleTerm", "TermExec" },
  config = function()
    require("toggleterm").setup {
      size = 20,
      open_mapping = [[<A-0>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    }
  end,
}
