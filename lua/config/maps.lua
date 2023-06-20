M = {}
local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.keymap.set

--Remap space as leader key
map('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
map('n', '<C-i>', '<C-i>', opts)

map('n', 'x', '"_x', opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-tab>', '<c-6>', opts)

-- Cancel search highlighting with ESC
map('n', '<ESC>', ':nohlsearch<Bar>:echo<CR>', opts)

map("n", "<leader>p", "<cmd>pu<cr>", opts)
map("n", "<leader>P", "<cmd>pu!<cr>", opts)
-- Visual --
-- Stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Select all
map('n', '<C-a>', 'gg<S-v>G', opts)

-- Resize with arrows
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map('n','vv','V', opts)
map('n','zz', '<cmd>wq<cr>', opts)
-- dont yank on visual paste
map('v', 'p', '"_dP', opts)

map('n', '<F4>', '<cmd>Telescope resume<cr>', opts)
map('n', '<F5>', '<cmd>Telescope commands<CR>', opts)
map(
  'n',
  '<F6>',
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  opts
)
map('n', '<F7>', '<cmd>TSHighlightCapturesUnderCursor<cr>', opts)
map('n', '<F8>', '<cmd>TSPlaygroundToggle<cr>', opts)
map('n', '<F11>', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)
map('n', '<C-p>', '<cmd>Telescope projects<cr>', opts)
map('n', '<C-t>', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)

M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ 'vim', 'help' }, filetype) then
    vim.cmd('h ' .. vim.fn.expand '<cword>')
  elseif vim.tbl_contains({ 'man' }, filetype) then
    vim.cmd('Man ' .. vim.fn.expand '<cword>')
  elseif vim.fn.expand '%:t' == 'Cargo.toml' then
    require('crates').show_popup()
  else
    vim.lsp.buf.hover()
  end
end
vim.keymap.set('n', 'K', ":lua require('config.maps').show_documentation()<CR>", opts)


vim.keymap.set(
  "n",
  "<tab>",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
  opts
)

-- Tabs
-- map('n', '<Tab>', '<cmd>BufferNext<CR>', opts)
-- map('n', '<S-Tab>', '<cmd>BufferPrevious<CR>', opts)
map('n', '<A-q>', '<cmd>BufferClose<CR>', opts)
map('n', '<leader>w', '<cmd>write<CR>', opts)
map('n', '<leader>q', '<cmd>quit<CR>', opts)
map('i', 'jj', '<Esc>', opts)

-- Easyalign
map('n', 'ga', '<Plug>(EasyAlign)', opts)
map('x', 'ga', '<Plug>(EasyAlign)', opts)
--
-- Browser Search
map('v', '<A-s>', ":'<,'>BrowserSearch<CR>", opts)

return M
