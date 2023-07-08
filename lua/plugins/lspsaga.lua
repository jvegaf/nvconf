local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({})

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
map('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { noremap = true, silent = true, desc = 'Hover Doc' })
map('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', { noremap = true, silent = true, desc = 'LSP finder' })
-- map('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
map('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true, desc = 'Signature help' })
map('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', { noremap = true, silent = true, desc = 'Peek definition' })
map('n', 'gr', '<Cmd>Lspsaga rename<CR>', { noremap = true, silent = true, desc = 'Rename' })
