local status, bsearch = pcall(require, "vim-browser-search")

if not status then
  return
end

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap('n', '<silent><leader>s', '<Plug>SearchNormal', opts)
keymap('v', '<silent><leader>s', '<Plug>SearchVisual', opts)
keymap('v', 's', ':\'<,\'>BrowserSearch<CR>', opts)
