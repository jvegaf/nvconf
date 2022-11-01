local status, accelerated = pcall(require, "accelerated-jk")

if not status then
  print('not accelerated')
  return
end

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap('n', 'j', '<Plug>(accelerated_jk_gj)', opts )
keymap('n', 'k', '<Plug>(accelerated_jk_gk)', opts )

