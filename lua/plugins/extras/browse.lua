return {
  {
    "voldikss/vim-browser-search",
    keys = { { "<A-s>", ":'<,'>BrowserSearch<cr>", mode = "v", desc = "Search on web" } },
  },
  {
    "lalitmee/browse.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    -- i = { "<cmd>BrowseInputSearch<cr>", "Input Search" },
    -- b = { "<cmd>Browse<cr>", "Browse" },
    -- d = { "<cmd>BrowseDevdocsSearch<cr>", "Devdocs" },
    -- f = { "<cmd>BrowseDevdocsFiletypeSearch<cr>", "Devdocs Filetype" },
    -- m = { "<cmd>BrowseMdnSearch<cr>", "Mdn" },


  },
}
